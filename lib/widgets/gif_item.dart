import 'package:flutter/material.dart';
import 'package:gif_search/ui/gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

Widget gifItem(dynamic item, BuildContext context) {
  return GestureDetector(
    child: FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: item['images']['fixed_height']['url'],
      height: 300.0,
      fit: BoxFit.cover,
    ),
    onLongPress: () => Share.share(
      item['images']['fixed_height']['url'],
    ),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GifPage(item),
      ),
    ),
  );
}
