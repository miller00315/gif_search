import 'package:flutter/material.dart';
import 'package:gif_search/ui/gif_page.dart';
import 'package:gif_search/widgets/gif_item.dart';
import 'package:share/share.dart';

Widget createGifTable(BuildContext context, AsyncSnapshot snapshot,
    Function getCount, Function loadMore) {
  return GridView.builder(
    padding: EdgeInsets.all(10.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: getCount(snapshot.data['data']),
    itemBuilder: (context, index) => index < snapshot.data['data'].length
        ? gifItem(snapshot.data['data'][index], context)
        : GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 70.0,
                ),
                Text(
                  'Carregar mais..',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                )
              ],
            ),
            onTap: () => loadMore(),
          ),
  );
}
