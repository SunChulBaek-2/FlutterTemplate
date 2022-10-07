import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        children: <Widget>[
          const Text("Tab3"),
          CachedNetworkImage(
            imageUrl: 'https://i.picsum.photos/id/7/250/250.jpg?hmac=cvSu7nF39jvX2EdUAeTtQYVgXO3TIVe5DBR21R_z7K8',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Text(error.toString()),
          )
        ],
      )
    );
  }
}