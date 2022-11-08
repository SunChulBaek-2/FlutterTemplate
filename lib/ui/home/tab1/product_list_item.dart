import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/ui/detail/product.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product, required this.onClick});

  final Product product;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        child: Row(
          children: [
            CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: product.thumbnail,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(product.desc, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                  ]
                )
              )
            )
          ],
        ),
        onTap: () => onClick.call(
            context,
            ProductParam(
              images: product.images.where((image) => !image.contains("thumbnail")).toList(),
              brand: product.brand,
              category: product.category,
              title: product.title,
              desc: product.desc,
              price: product.price,
              discount: product.discount,
              stock: product.stock,
              rating: product.rating
            )
          )
        )
      );
  }
}