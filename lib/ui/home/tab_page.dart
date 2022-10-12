import 'package:flutter/material.dart';

abstract class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context, String text) {
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}