import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Education', style:TextStyle(color:Colors.purple),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('BE in Artificial Intelligence and Data Science',style: TextStyle(fontWeight:FontWeight.w400),),
              subtitle: Text('Sandip Foundations Sandip Polytechnic, Nashik',style: TextStyle(color: Colors.pink),),
            ),
            ListTile(
              title: Text('Diploma in Computer Engineering'),
              subtitle: Text('Sandip Foundations Sandip Polytechnic, Nashik',style: TextStyle(color: Colors.pink)),
            ),
            ListTile(
              title: Text('HSC (12th)'),
              subtitle: Text('MSG Art,Science and Commerce College, Malegaon camp, Malegaon',style: TextStyle(color: Colors.pink)),
            ),
            ListTile(
              title: Text('SSC (10th)'),
              subtitle: Text('L.V.H Madhyamik Vidhyalaya, Mahalpatane',style: TextStyle(color: Colors.pink)),
            ),
            // Add more education details here
          ],
        ),
      ),
    );
  }
}

