import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallpaper_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_wallpapers/screens/wallpaper_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        
        title: Text(category),
      ),
      body: FutureBuilder(
        future: wallpaperProvider.fetchWallpapers(category),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching wallpapers'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10.0),
              itemCount: wallpaperProvider.wallpapers.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WallpaperDetailScreen(wallpaperProvider.wallpapers[i]),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: wallpaperProvider.wallpapers[i]['src']['medium'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
