import 'package:flutter/material.dart';

abstract class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context, String text) {
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

abstract class TabState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {

  void showSnackBar(BuildContext context, String text) {
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  bool get wantKeepAlive => true;
}