import 'package:flutter/material.dart';

class TodoPrivacy extends StatelessWidget {
  const TodoPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Last updated: July 31, 2024',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Introduction',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use the Service and tells You about Your Privacy rights and how the Law protects you.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Information Collection and Use',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We collect several different types of information for various purposes to provide and improve our Service to you.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'How We Use Your Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We use Your Personal data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with the Privacy Policy.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Data Security',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We strive to use commercially acceptable means to protect Your Personal Data, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Your Data Protection Rights',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Depending on your location, you may have the following data protection rights: the right to access, the right to rectification, the right to erasure, the right to restrict processing, the right to data portability, and the right to object.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Changes to This Privacy Policy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'If You have any questions about this Privacy policy, You can contact us:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  'By phone number: 1234567890',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text(
                  'By email: contact@myapp.com',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
