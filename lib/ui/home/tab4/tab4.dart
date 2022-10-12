import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/tab_page.dart';

class Tab4Page extends TabPage {
  const Tab4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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