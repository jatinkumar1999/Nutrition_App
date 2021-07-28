import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class chachedImage extends StatefulWidget {
  chachedImage({Key key}) : super(key: key);

  @override
  _chachedImageState createState() => _chachedImageState();
}

class _chachedImageState extends State<chachedImage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text("item ${index++}"),
              leading: buildImage(index),
            ),
          );
        });
  }

  buildImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: "https://source.unsplash.com/random?sig=$index",
        fit: BoxFit.cover,
        width: 50,
        height: 50,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
