import 'package:flutter/material.dart';
import 'package:unsplash_app/constants.dart';
class ListPhotosPage extends StatefulWidget {
  @override
  _ListPhotosPageState createState() => _ListPhotosPageState();
}

class _ListPhotosPageState extends State<ListPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        addAutomaticKeepAlives: true,
        children: photoList,
      ),
    );
  }
}
