import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WallpaperDetailScreen extends StatelessWidget {
  final dynamic wallpaper;

  WallpaperDetailScreen(this.wallpaper);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper Details'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: wallpaper['src']['large'],
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () {
          // Implement download functionality here
        },
      ),
    );
  }
}
