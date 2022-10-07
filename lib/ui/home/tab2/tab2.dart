import 'package:flutter/cupertino.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab2PageState();
}

class Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Tab2")
        ],
      )
    );
  }
}