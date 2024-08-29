import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/home.dart';

class LoginTodo extends StatefulWidget {
  const LoginTodo({Key? key}) : super(key: key);

  @override
  State<LoginTodo> createState() => _LoginTodoState();
}

class _LoginTodoState extends State<LoginTodo> {
  String username = "user";
  String password = "1234";

  final usernameController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('loggedIn') ?? false;
    if (loggedIn) {
      // Navigate to the home page if logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TodoHome()),
      );
    }
  }

  Future<void> _login() async {
    final enteredUsername = usernameController.text;
    final enteredPassword = passController.text;

    if (username == enteredUsername && password == enteredPassword) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TodoHome()),
      );
    } else {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 34, 33, 1),
        title: Text(
          "LoGiN",
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
              Color.fromRGBO(2, 119, 49, 1), // Deep purple
              Color.fromRGBO(62, 111, 83, 1), // Light purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: passController,
                    obscureText: true, // Hide password text
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(203, 192, 204, 1), // Button color
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Sign In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
