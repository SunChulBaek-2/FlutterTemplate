import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/photo.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: CachedNetworkImage(
          width: 32,
          height: 32,
          // TODO : jsonplaceholder의 이미지 로딩 안됨.
          imageUrl: photo.thumbnailUrl,
          //imageUrl: 'https://www.gstatic.com/devrel-devsite/prod/v24d520161c9661e427a3f6fa9973bfca56d0972dca82fa8ef65c709d915e80f3/android/images/touchicon-180.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(photo.title),
        dense: true,
      )
    );
  }
}