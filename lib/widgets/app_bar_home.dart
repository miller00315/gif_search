import 'package:flutter/material.dart';

Widget appBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Image.network(
        'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
    centerTitle: true,
  );
}
