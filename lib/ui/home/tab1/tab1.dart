import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:flutter_template/bloc/photos_bloc.dart';
import 'package:flutter_template/ui/home/tab1/bottom_loader.dart';
import 'package:flutter_template/ui/home/tab1/photo_list_item.dart';

class Tab1Page extends TabPage {
  const Tab1Page({Key? key, required int index}) : super(key: key, index: index);

  @override
  State<StatefulWidget> createState() => _Tab1State();
}

class _Tab1State extends TabState<Tab1Page> {
  late PhotosBloc _photosBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _photosBloc = PhotosBloc();
    _photosBloc.add(PhotosFetched(20));
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
                    child: ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return index >= state.photos.length
                          ? const BottomLoader()
                          : PhotoListItem(photo: state.photos[index]);
                      },
                      itemCount: state.photos.length,
                    ),
                    onRefresh: () async {
                      showSnackBar("리프레시!!!");
                      final photosBloc = BlocProvider.of<PhotosBloc>(context);
                      photosBloc.add(PhotosFetched(20));
                    }
                  );
              }
            }
        )
    );
  }

  @override
  void onDoubleTap() {
    // TabPage.index에 해당하는 탭의 더블탭 이벤트를 받음
    showSnackBar("탭1 리셀렉~");
    _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
    );
  }
}