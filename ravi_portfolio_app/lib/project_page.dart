import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Flutter Simple Calculator App',
      'description': 'Simple daily use Calculator',
      'link': 'https://github.com/RavindraPanditAhire/Flutter-Projects/tree/master/flutter_calculator'
    },
    {
      'title': 'Flutter Tic Tac Toe',
      'description': 'Simple Entertaining Tic Tac Toe',
      'link': 'https://github.com/RavindraPanditAhire/Flutter-Projects/tree/master/tic_tac_toe'
    },
    {
      'title': 'My Portfolio Web App',
      'description': 'portfolio web application to showcase my technical activities',
      'link': 'https://ravindraahireportfolio.web.app'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Projects',style: TextStyle(color:Colors.purple),),
      ),
      body: Container(

        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(projects[index]['title']!),
              subtitle: Text(projects[index]['description']!),
              onTap: () async {
                final url = Uri.parse(projects[index]['link']!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  // Show an error message if the URL can't be launched
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch $url')),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
