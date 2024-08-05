import 'category_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  final List<String> categories = [
    'Nature',
    'Cars',
    'Space',
    'Animals',
    'City',
    'Abstract',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Daily Wallpapers'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10.0),
        itemCount: categories.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryScreen(categories[i]),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Center(
              child: Text(
                categories[i],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
