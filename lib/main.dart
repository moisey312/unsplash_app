import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unsplash_app/resourse/constantsAndVariables.dart';
import 'package:unsplash_app/pages/listPhotosPage.dart';
import 'package:unsplash_app/photoWidget.dart';
import 'package:unsplash_app/resourse/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void preload()async{
    await responsePhotos();
    await addToListView();
  }
  Future addToListView()async{
    for(var photo in photoData){
      CachedNetworkImage(imageUrl:photo['urls']['full']);
      CachedNetworkImage(imageUrl: photo['urls']['small']);
      photoList.add(PhotoWidget(urlFull:photo['urls']['full'], urlSmall:photo['urls']['small'], username:photo['user']['name'], description:photo['description']));
    }

  }
  Future responsePhotos()async{
    var response = await http.get(unsplashUrl+'client_id='+'9d7t83grKO4BaqP2DKXixhQtCXOi9JeFjB_24oqQzEY',);
    photoData = json.decode(response.body);
  }
  Future<bool> checkInternetAndPreload() async {
    var result = await Connectivity().checkConnectivity();
    internetOn = !(result == ConnectivityResult.none);
    if (internetOn) {
      preload();
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkInternetAndPreload(),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error.toString() + 'error');
              return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(color: primaryColor),
                    child: Center(
                        child: Text('Try restart app',
                            style: TextStyle(color: Colors.white))),
                  ));
            } else {
              if (internetOn)
                return new ListPhotosPage();
              else
                return Scaffold(
                    body: Container(
                      decoration: BoxDecoration(color: primaryColor),
                      child: Center(
                          child: Text('No network connection',
                              style: TextStyle(color: Colors.white))),
                    ));
            }
            break;
          default:
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  color: primaryColor
                ),
                child: Center(
                  child: Text('Loading', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: Colors.white),),
                ),
              ),
            );
        }
      },
    );
  }
}
