import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/photos_bloc.dart';
import 'package:flutter_template/ui/home/tab1/bottom_loader.dart';
import 'package:flutter_template/ui/home/tab1/photo_list_item.dart';
import 'package:http/http.dart' as http;

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab1PageState();
}

class Tab1PageState extends State<Tab1Page> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)
        ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PhotosBloc(httpClient: http.Client())..add(PhotosFetched()),
        child: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              switch (state.status) {
                case PhotosStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case PhotosStatus.failure:
                  // TODO : 에러 화면
                  return Text('failure');
                case PhotosStatus.success:
                  if (state.photos.isEmpty) {
                    return const Center(child: Text('no photos'));
                  }
                  return ListView.separated(itemBuilder: (BuildContext context, int index) {
                      return index >= state.photos.length ? const BottomLoader() : PhotoListItem(photo: state.photos[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(thickness: 1);
                    },
                    itemCount: state.photos.length,
                    controller: _scrollController
                  );
              }
            }
        )
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<PhotosBloc>().add(PhotosFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}