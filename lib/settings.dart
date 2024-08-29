import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/login.dart';

class TodoSettings extends StatefulWidget {
  const TodoSettings({super.key});

  @override
  _TodoSettingsState createState() => _TodoSettingsState();
}

class _TodoSettingsState extends State<TodoSettings> {
  // Function to show a confirmation dialog before logging out
  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // User must select an option
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User cancels
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirms
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', false); // Clear login status

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginTodo()),
         (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(149, 81, 156, 1),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: _confirmLogout,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 30), // Adjust padding for better button size
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
