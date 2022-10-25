import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewArguments {
  WebViewArguments({required this.title, required this.url});

  String title;
  String url;
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.title, required this.url});

  static const routeName = "/webview";

  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewScreen> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.title)
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? const Center(child: CircularProgressIndicator()) : Stack()
        ]
      )
    );
  }
}