import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WallpaperProvider with ChangeNotifier {
  final String apiKey = 'S3Z7EnRJ0CUid45AQYbPLiUKdlKDV82qKjVyiXS8svWBCmZacmQFoWnX';
  List<dynamic> _wallpapers = [];

  List<dynamic> get wallpapers => _wallpapers;

  Future<void> fetchWallpapers(String category) async {
    final url = 'https://api.pexels.com/v1/search?query=$category&per_page=20';
    final response = await http.get(Uri.parse(url), headers: {'Authorization': apiKey});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _wallpapers = data['photos'];
      notifyListeners();
    } else {
      throw Exception('Failed to load wallpapers');
    }
  }
}
