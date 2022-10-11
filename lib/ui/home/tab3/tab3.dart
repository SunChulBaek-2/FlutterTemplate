import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/counter_cubit.dart';
import 'package:flutter_template/ui/home/tab3/counter_view.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab3PageState();
}

class Tab3PageState extends State<Tab3Page> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterView()
    );
  }
}