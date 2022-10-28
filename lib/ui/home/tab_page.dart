import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/injectable.dart';

abstract class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.index}) : super(key: key);

  final int index;
}

abstract class TabState<T extends TabPage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  final EventBus _eventBus = getIt<EventBus>();

  @override
  void initState() {
    super.initState();
    _eventBus.on<BottomNavItemReselectEvent>().listen((event) {
      if (event.index == widget.index) {
        onDoubleTap();
      }
    });
  }

  void showSnackBar(String text) {
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  bool get wantKeepAlive => true;

  void onDoubleTap() { }
}