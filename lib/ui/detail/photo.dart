import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoParam {
  final String url;
  final String title;

  PhotoParam(this.url, this.title);
}

class PhotoScreen extends StatelessWidget {
  final PhotoParam param;

  const PhotoScreen({Key? key, required this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: param.url,
              width: double.infinity,
              fit: BoxFit.cover
            ),
            Text(param.title)
          ],
        )
      )
    );
  }
}