import 'package:flutter/material.dart';

class TodoAbout extends StatelessWidget {
  const TodoAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        title: Text(
          "About",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        // Use a Container with a gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(149, 81, 156, 1), // Purple color
              Color.fromRGBO(255, 192, 203, 1), // Light pink color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Developed By:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'BILIN LALICHAN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'AIBIN JOSEPH',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'ANANDHU KRISHNA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'MATHEWS JOY JOSEPH',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'EDWIN JOSEPH',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Institution: St Berchmans College',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Changanassery, Kottayam',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Course: BCA',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Semester: S5',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
