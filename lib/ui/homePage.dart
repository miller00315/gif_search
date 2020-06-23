import 'package:flutter/material.dart';
import 'package:gif_search/widgets/app_bar_home.dart';
import 'package:gif_search/widgets/body_home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onSubmited(text) {
    setState(() {
      _search = text;
    });
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  void _loadMore() {
    setState(() {
      _offset += 19;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(_onSubmited, _search, _offset, _getCount, _loadMore),
      backgroundColor: Colors.black,
    );
  }
}
