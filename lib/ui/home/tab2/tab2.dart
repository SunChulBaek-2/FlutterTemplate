import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/timer_bloc.dart';
import 'package:flutter_template/ticker.dart';
import 'package:flutter_template/ui/home/tab2/timer_view.dart';
import 'package:flutter_template/ui/home/tab_page.dart';

class Tab2Page extends TabPage {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TimerBloc(ticker: const Ticker()),
        child: const TimerView()
    );
  }
}