import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/model/photo.dart';
import 'package:flutter_template/ui/detail/photo.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({super.key, required this.photo});

  final Photo photo;

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
              // TODO : jsonplaceholder의 이미지 로딩 안됨.
              //imageUrl: photo.thumbnailUrl,
              imageUrl: 'https://picsum.photos/250?image=9',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(photo.title)
            )
          ],
        ),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhotoScreen(
                param: PhotoParam(
                  'https://picsum.photos/250?image=9',
                  photo.title
                )
              )
            )
          )
        },
      )
    );
  }
}