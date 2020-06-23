import 'package:flutter/material.dart';
import 'package:gif_search/ui/git_page.dart';

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
        ? GestureDetector(
            child: Image.network(
              snapshot.data['data'][index]['images']['fixed_height']['url'],
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GifPage(snapshot.data['data'][index]),
              ),
            ),
          )
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
