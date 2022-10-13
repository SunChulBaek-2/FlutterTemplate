import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/cubit/counter_cubit.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/ui/home/tab3/counter_view.dart';
import 'package:flutter_template/ui/home/tab_page.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Tab3State();
}

class _Tab3State extends TabState<Tab3Page> {
  @override
  void initState() {
    super.initState();
    eventBus.on<BottomNavItemReselectEvent>().listen((event) {
      if (event.index == 3) {
        showSnackBar(context, "Tab3 리셀렉~");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterView()
    );
  }
}