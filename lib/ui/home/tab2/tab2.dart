import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/tab_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Tab2State();
}

class _Tab2State extends TabState<Tab2Page> {
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
    return const WebView(
        initialUrl: "https://www.google.com"
    );
  }
}