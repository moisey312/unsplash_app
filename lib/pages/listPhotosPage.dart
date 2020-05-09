import 'package:flutter/material.dart';
import 'package:unsplash_app/resourse/constantsAndVariables.dart';
import 'package:unsplash_app/resourse/styles.dart';

class ListPhotosPage extends StatefulWidget {
  @override
  _ListPhotosPageState createState() => _ListPhotosPageState();
}

class _ListPhotosPageState extends State<ListPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Unsplash',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 22),
        )),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        addAutomaticKeepAlives: true,
        children: photoList,
      ),
    );
  }
}
