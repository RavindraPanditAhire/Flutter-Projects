import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to the Home Page'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the About Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
              child: Text('Go to About Page'),
            ),
          ],
        ),
      ),
    );
  }
}

// class that shows data about about section
  class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('About Page'),
      ),
      body: Center(
        child: Text('This is the About Page'),
      ),
    );
  }
}
