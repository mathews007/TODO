import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'about.dart';
import 'privacy.dart';
import 'profile.dart';
import 'settings.dart';
import 'task.dart';
import 'task_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, String>> _tasks = [];

  final String _username = 'User';
  final String _profileImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAvDYVf3eZzlN29oc_tbVPjckkOL2GMsAa-Q&s';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the app starts
  }

  void _addTask(Map<String, String> task) async {
    setState(() {
      _tasks.add(task);
    });
    await _saveTasks(); // Save tasks to SharedPreferences
  }

  void _deleteTask(int index) async {
    setState(() {
      _tasks.removeAt(index);
    });
    await _saveTasks(); // Save tasks to SharedPreferences
  }

  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList = _tasks.map((task) => json.encode(task)).toList();
    await prefs.setStringList('tasks', taskList);
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');
    if (taskList != null) {
      setState(() {
        _tasks = taskList.map((task) => Map<String, String>.from(json.decode(task))).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        title: Text(
          "To Do",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 245, 245),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(_profileImageUrl),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _username,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoSettings()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoPrivacy()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoAbout()),
                );
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Version 7.0.7'),
              trailing: Icon(Icons.info_outline),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromRGBO(255, 255, 204, 1), // Light yellow
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            final categoryColor = _getCategoryColor(task['category']!);
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              child: ListTile(
                tileColor: categoryColor,
                title: Text(task['description']!),
                subtitle: Text(
                  '${task['category']} - ${task['date']} at ${task['time']}',
                  style: TextStyle(color: Colors.black54),
                ),
                contentPadding: EdgeInsets.all(16),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Color.fromARGB(216, 236, 222, 221)),
                  onPressed: () {
                    _showDeleteConfirmationDialog(index);
                  },
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(
                        task: task,
                        backgroundColor: categoryColor,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoTask()),
          );
          if (result != null && result is Map<String, String>) {
            _addTask(result);
          }
        },
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'GYM':
        return Colors.orange;
      case 'WALKING':
        return Colors.green;
      case 'RUNNING':
        return Colors.red;
      case 'SWIMMING':
        return Colors.blue;
      case 'EAT':
        return Colors.yellow;
      case 'WORK':
        return Colors.grey;
      case 'OTHER':
        return Colors.purple;
      default:
        return Colors.white;
    }
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteTask(index);
              },
            ),
          ],
        );
      },
    );
  }
}
