import 'package:flutter/cupertino.dart';

class Tab4Page extends StatefulWidget {
  const Tab4Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab4PageState();
}

class Tab4PageState extends State<Tab4Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Tab4")
        ],
      )
    );
  }
}