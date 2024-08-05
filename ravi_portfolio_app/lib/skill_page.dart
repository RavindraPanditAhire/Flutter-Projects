import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  final List<String> skills = [
    'Java',
    'C++',
    'SQL',
    'HTML',
    'Python',
    'Android Studio',
    'VS Code',
    'PyCharm',
    'IntelliJ',
    'Git',
    'GitHub',
    'Flutter',
    'FlutterFlow'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Skills',style: TextStyle(color: Colors.purple),),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(skills[index],style:TextStyle(color: Colors.green),)
          );
        },
      ),
    );
  }
}
