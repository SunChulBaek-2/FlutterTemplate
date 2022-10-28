import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/common/error.dart';
import 'package:flutter_template/ui/common/loading.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:flutter_template/bloc/products_cubit.dart';
import 'package:flutter_template/ui/home/tab1/bottom_loader.dart';
import 'package:flutter_template/ui/home/tab1/product_list_item.dart';

class Tab1Page extends TabPage {
  const Tab1Page({Key? key, required int index}) : super(key: key, index: index);

  @override
  State<StatefulWidget> createState() => _Tab1State();
}

class _Tab1State extends TabState<Tab1Page> {
  final ProductsCubit _productsCubit = getIt<ProductsCubit>()..init();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => _productsCubit,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state.status) {
            case ProductsStatus.initial:
              return const LoadingScreen();
            case ProductsStatus.failure:
              return const ErrorScreen();
            case ProductsStatus.success:
              if (state.products.isEmpty) {
                return const Center(child: Text('No products'));
              }
              return RefreshIndicator(
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.products.length
                        ? const BottomLoader()
                        : ProductListItem(product: state.products[index]);
                    },
                    itemCount: state.products.length,
                  )
                ),
                onRefresh: () async {
                  showSnackBar("리프레시!!!");
                  _productsCubit.init();
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