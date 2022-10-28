import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/counter_cubit.dart';
import 'package:flutter_template/ui/home/tab3/counter_view.dart';
import 'package:flutter_template/ui/home/tab_page.dart';

class Tab3Page extends TabPage {
  const Tab3Page({Key? key, required int index}) : super(key: key, index: index);

  @override
  State<StatefulWidget> createState() => _Tab3State();
}

class _Tab3State extends TabState<Tab3Page> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView()
    );
  }

  @override
  void onDoubleTap() {
    // TabPage.index에 해당하는 탭의 더블탭 이벤트를 받음
    showSnackBar("탭3 리셀렉~");
  }
}