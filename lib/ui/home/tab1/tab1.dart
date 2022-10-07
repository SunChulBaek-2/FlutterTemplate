import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/counter_cubit.dart';
import 'package:flutter_template/ui/home/tab1/counter_view.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab1PageState();
}

class Tab1PageState extends State<Tab1Page> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView()
    );
  }
}