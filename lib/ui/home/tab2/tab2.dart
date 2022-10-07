import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/timer_bloc.dart';
import 'package:flutter_template/ticker.dart';
import 'package:flutter_template/ui/home/tab2/timer_view.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab2PageState();
}

class Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView()
    );
  }
}