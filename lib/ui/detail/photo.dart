import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoParam {
  final String url;
  final String title;

  PhotoParam(this.url, this.title);
}

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/photo";

  final PhotoParam param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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