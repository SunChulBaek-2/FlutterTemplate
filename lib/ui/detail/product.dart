import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductParam {
  final String url;
  final String title;

  ProductParam(this.url, this.title);
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/product";

  final ProductParam param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
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