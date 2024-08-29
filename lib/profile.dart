import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username = 'User'; // Replace with dynamic username if needed
  final String profileImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAvDYVf3eZzlN29oc_tbVPjckkOL2GMsAa-Q&s'; // Replace with dynamic image URL if needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(200, 200, 255, 1), // Light Blue
              Color.fromRGBO(100, 100, 255, 1), // Darker Blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  SizedBox(width: 16),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Additional profile information could be added here
            ],
          ),
        ),
      ),
    );
  }
}
