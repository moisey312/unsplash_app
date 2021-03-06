import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_app/pages/showPhoto.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget({this.urlFull, this.urlSmall, this.username, this.description});
  final String urlFull;
  final String urlSmall;
  final String username;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => ShowPhoto(
                        url: urlFull,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(10.0)),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      username,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
              ),
              Center(
                  child: Container(
                      height: 180,
                      child: Image(
                        image: CachedNetworkImageProvider(urlSmall),
                        fit: BoxFit.fitHeight,
                      ))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: description == null
                      ? Container()
                      : Text(
                          description,
                          style: TextStyle(fontSize: 11),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
