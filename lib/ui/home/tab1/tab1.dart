import 'package:flutter/cupertino.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab1PageState();
}

class Tab1PageState extends State<Tab1Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Tab1")
        ],
      )
    );
  }
}