import 'package:flutter/material.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/ui/home/tab_page.dart';

class Tab4Page extends StatefulWidget {
  const Tab4Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Tab4State();
}

class _Tab4State extends TabState<Tab4Page> {
  @override
  void initState() {
    super.initState();
    eventBus.on<BottomNavItemReselectEvent>().listen((event) {
      if (event.index == 4) {
        showSnackBar(context, "Tab4 리셀렉~");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Tab4"),
            ElevatedButton(
                onPressed: () {
                  // 스낵바 호출
                  showSnackBar(context, '탭4!!!');
                },
                child: const Text('Show SnackBar')
            ),
          ],
        )
    );
  }
}