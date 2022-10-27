import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductParam {
  final List<String> images;
  final String title;

  ProductParam(this.images, this.title);
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/product";

  final ProductParam param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(param.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              CachedNetworkImage(
                imageUrl: param.images[index],
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(param.images[index].substring(param.images[index].lastIndexOf("/") + 1))
                )
              )
            ]
          );
        },
        itemCount: param.images.length,
      )
    );
  }
}