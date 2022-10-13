import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tab2Page extends TabPage {
  const Tab2Page({Key? key, required int index}) : super(key: key, index: index);

  @override
  State<StatefulWidget> createState() => _Tab2State();
}

class _Tab2State extends TabState<Tab2Page> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: "https://www.google.com",
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? const Center(child: CircularProgressIndicator()) : Stack()
      ]
    );
  }

  @override
  void onDoubleTap() {
    // TabPage.index에 해당하는 탭의 더블탭 이벤트를 받음
    showSnackBar("탭2 리셀렉~");
  }
}