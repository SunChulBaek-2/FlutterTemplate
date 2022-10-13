import 'package:flutter/material.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/main.dart';

abstract class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.index}) : super(key: key);

  final int index;
}

abstract class TabState<T extends TabPage> extends State<T>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    eventBus.on<BottomNavItemReselectEvent>().listen((event) {
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