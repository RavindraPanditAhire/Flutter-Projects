import 'education.dart';
import 'skill_page.dart';
import 'project_page.dart';
import 'contact_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ravindra\'s Portfolio',style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),

        children: [
          const Center( // Center the CircleAvatar
            child: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage("assets/profile_picture.jpg"),
            ),
          ),
          SizedBox(height: 30),
          Center( // Center the name text
            child: Text(
              'Ravindra Pandit Ahire',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.blue),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'BE in Artificial Intelligence and Data Science\nThird Year Student',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,color: Colors.green),
          ),
          SizedBox(height: 20),
          Text(
            'I am currently residing in Pune and have a strong foundation in various programming languages and tools. I am also embarking on my journey in Flutter development.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
          _buildButton(context, 'View My Skills', SkillsScreen()),
          SizedBox(height: 15),
          _buildButton(context, 'View My Projects', ProjectsScreen()),
          SizedBox(height: 15),
          _buildButton(context, 'View My Education', EducationScreen()),
          SizedBox(height: 15),
          _buildButton(context, 'Contact Me', ContactScreen()),
        ],
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, String text, Widget destination) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: 18),
        backgroundColor: Colors.blueAccent, // Customize button color
      ),
      child: Text(text, style: TextStyle(color: Colors.white)), // Customize text color
    );
  }
}