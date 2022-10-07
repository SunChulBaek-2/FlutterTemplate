import 'package:flutter/cupertino.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Tab3PageState();
}

class Tab3PageState extends State<Tab3Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Tab3")
        ],
      )
    );
  }
}