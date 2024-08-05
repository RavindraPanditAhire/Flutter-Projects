import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_model.dart'; // Make sure this model matches the API response structure

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Future<news_mudule> fetchNews() async {
    final url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-07-04&sortBy=publishedAt&apiKey=29b2d3faaf24493bbdf9d99fe0eb396f";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return news_mudule.fromJson(result); // Assuming fromJson is a method in your model class
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: FutureBuilder<news_mudule>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data?.articles == null || snapshot.data!.articles!.isEmpty) {
            return Center(child: Text('No articles available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data!.articles![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${article.urlToImage ?? ''}"),
                  ),
                  title: Text("${article.title ?? 'No title'}"),
                  subtitle: Text("${article.description ?? 'No description'}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
