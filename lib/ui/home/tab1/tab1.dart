import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
        create: (_) => PhotosBloc(httpClient: http.Client())..add(PhotosFetched()),
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
                  return ListView.builder(itemBuilder: (BuildContext context, int index) {
                    return index >= state.photos.length ? const BottomLoader() : PhotoListItem(photo: state.photos[index]);
                  },
                    itemCount: state.photos.length,
                  );
              }
            }
        )
    );
  }
}