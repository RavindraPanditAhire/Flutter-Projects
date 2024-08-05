import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Contact Me', style: TextStyle(color: Colors.purple)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'Ravindraahire897@gmail.com',
                );
                await launch(emailUri.toString());
              },
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Ravindraahire897@gmail.com'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri phoneUri = Uri(
                  scheme: 'tel',
                  path: '9322026193',
                );
                await launch(phoneUri.toString());
              },
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('9322026193'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri mapUri = Uri(
                  scheme: 'https',
                  host: 'www.google.com',
                  path: 'maps/search/',
                  queryParameters: {
                    'api': '1',
                    'query': 'Near Samaj Kalyan Bhavan, Government Hostel, Mental Corner, Vishrantwadi, Pune-411006',
                  },
                );
                await launch(mapUri.toString());
              },
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Near Samaj Kalyan Bhavan, Government Hostel, Mental Corner, Vishrantwadi, Pune-411006'),
              ),
            ),
            // Add more contact details and social media links here
          ],
        ),
      ),
    );
  }
}
