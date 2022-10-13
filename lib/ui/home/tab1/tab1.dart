import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:flutter_template/bloc/photos_bloc.dart';
import 'package:flutter_template/ui/home/tab1/bottom_loader.dart';
import 'package:flutter_template/ui/home/tab1/photo_list_item.dart';
import 'package:http/http.dart' as http;

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Tab1State();
}

class _Tab1State extends TabState<Tab1Page> {
  late PhotosBloc _photosBloc;

  @override
  void initState() {
    super.initState();
    _photosBloc = PhotosBloc(httpClient: http.Client());
    _photosBloc.add(PhotosFetched());
    eventBus.on<BottomNavItemReselectEvent>().listen((event) {
      if (event.index == 1) {
        showSnackBar(context, "Tab1 리셀렉~");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
        create: (_) => _photosBloc,
        child: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              switch (state.status) {
                case PhotosStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case PhotosStatus.failure:
                  // TODO : 에러 화면
                  return const Text('Error');
                case PhotosStatus.success:
                  if (state.photos.isEmpty) {
                    return const Center(child: Text('No photos'));
                  }
                  return RefreshIndicator(
                    child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                      return index >= state.photos.length
                          ? const BottomLoader()
                          : PhotoListItem(photo: state.photos[index]);
                      },
                      itemCount: state.photos.length,
                    ),
                    onRefresh: () async {
                      showSnackBar(context, "리프레시!!!");
                      final photosBloc = BlocProvider.of<PhotosBloc>(context);
                      photosBloc.add(PhotosFetched());
                    }
                  );
              }
            }
        )
    );
  }
}