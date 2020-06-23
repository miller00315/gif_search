import 'package:flutter/material.dart';
import 'package:gif_search/api/repository.dart';
import 'package:gif_search/widgets/gif_table.dart';

Widget body(Function onSubmited, String search, int offset, Function getCount,
    Function loadMore) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Pesquise aqui',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
          onSubmitted: (text) => onSubmited(text),
        ),
      ),
      Expanded(
        child: FutureBuilder(
          future: getGifs(search, offset),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                );
              default:
                {
                  if (snapshot.hasError)
                    return Container();
                  else
                    return createGifTable(
                        context, snapshot, getCount, loadMore);
                }
            }
          },
        ),
      ),
    ],
  );
}
