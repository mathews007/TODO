import 'package:flutter/material.dart';
import 'package:my_app/task.dart'; // Adjust import according to your file structure

class TaskDetailPage extends StatefulWidget {
  final Map<String, String> task;
  final Color backgroundColor;

  TaskDetailPage({required this.task, required this.backgroundColor});

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late Map<String, String> _task;
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _task = Map.from(widget.task);
    _backgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        backgroundColor: _backgroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _backgroundColor.withOpacity(0.2),
              _backgroundColor.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDetailCard('Description', _task['description']!),
                _buildDetailCard('Category', _task['category']!),
                _buildDetailCard('Date', _task['date']!),
                _buildDetailCard('Time', _task['time']!),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back to List',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String content) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: _backgroundColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoTask(
          initialCategory: _task['category']!,
          initialDescription: _task['description']!,
          initialDate: DateTime.parse(_task['date']!),
          initialTime: TimeOfDay(
            hour: int.parse(_task['time']!.split(':')[0]),
            minute: int.parse(_task['time']!.split(':')[1]),
          ),
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        _task = result;
      });
    }
  }
}
