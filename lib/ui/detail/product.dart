import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductParam {
  ProductParam({
    required this.images,
    required this.brand,
    required this.category,
    required this.title,
    required this.desc,
    required this.price,
    required this.discount,
    required this.stock,
    required this.rating
  });

  final List<String> images;
  final String brand;
  final String category;
  final String title;
  final String desc;
  final int price;
  final double discount;
  final int stock;
  final double rating;
}

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/product";

  final ProductParam param;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(param.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              children: param.images.map((image) =>
                CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              ).toList(),
            )
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: param.images.length,
              effect: const JumpingDotEffect(
                dotWidth: 10,
                dotHeight: 10,
                spacing: 6
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
            child: Text('${param.category} > ${param.brand}', style: const TextStyle(color: Colors.blue))
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
            child: Text(param.title, style: const TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
            child: Text('\$${param.price} (${param.discount}% off) 재고: ${param.stock} 평점: ${param.rating}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
          ),
          Padding(
              padding: const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
              child: Text(param.desc, style: const TextStyle(fontSize: 16))
          ),
        ]
      )
    );
  }
}