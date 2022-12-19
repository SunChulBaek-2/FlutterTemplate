import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/model/state_base.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/common/state_view.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:flutter_template/bloc/products_cubit.dart';
import 'package:flutter_template/ui/home/tab1/bottom_loader.dart';
import 'package:flutter_template/ui/home/tab1/product_list_item.dart';

class Tab1Page extends TabPage {
  const Tab1Page({Key? key, required int index, required this.onClickItem}) : super(key: key, index: index);

  final void Function(BuildContext context, Object param) onClickItem;

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
      child: BlocBuilder<ProductsCubit, StateXBase>(
        builder: (context, state) {
          final products = state is StateX ? (state as StateX<ProductsData>).data.products : null;
          return StateView(
            state: state,
            child: (products?.isEmpty ?? true)
              ? const Center(child: Text('No products'))
              : RefreshIndicator(
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= products!.length
                      ? const BottomLoader()
                      : ProductListItem(
                      product: products[index],
                      onClick: widget.onClickItem
                    );
                  },
                  itemCount: products!.length,
                )
              ),
              onRefresh: () async {
                showSnackBar("리프레시!!!");
                _productsCubit.init();
              }
            )
          );
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