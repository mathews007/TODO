import 'package:flutter/material.dart';

class TodoTask extends StatefulWidget {
  final String? initialCategory;
  final String? initialDescription;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;

  const TodoTask({
    Key? key,
    this.initialCategory,
    this.initialDescription,
    this.initialDate,
    this.initialTime,
  }) : super(key: key);

  @override
  _TodoTaskState createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  final List<String> categoryItems = [
    "Select Category",
    "GYM",
    "WALKING",
    "RUNNING",
    "SWIMMING",
    "EAT",
    "WORK",
    "OTHER",
  ];

  late String selectedCategory;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory ?? "Select Category";
    selectedDate = widget.initialDate ?? DateTime.now();
    selectedTime = widget.initialTime ?? TimeOfDay.now();
    _descriptionController.text = widget.initialDescription ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 81, 156, 1),
        title: Text(
          widget.initialCategory == null ? "Add Task" : "Edit Task",
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
              Color.fromRGBO(4, 250, 73, 1),
              Color.fromRGBO(82, 152, 83, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildCategoryDropdown(),
              _buildDescriptionInput(),
              _buildDateSelector(),
              _buildTimeSelector(),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedCategory,
        items: categoryItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedCategory = value!;
          });
        },
        decoration: InputDecoration(
          labelText: 'Category',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _descriptionController,
        maxLines: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter task description",
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            "Selected Date: ${selectedDate.toLocal().toString().split(' ')[0]}",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            child: const Text("Select Date"),
            onPressed: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2024),
                lastDate: DateTime(3000),
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            "Selected Time: ${selectedTime.format(context)}",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            child: const Text("Select Time"),
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (timeOfDay != null) {
                setState(() {
                  selectedTime = timeOfDay;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          final description = _descriptionController.text.trim();
          if (selectedCategory != "Select Category" && description.isNotEmpty) {
            Navigator.pop(context, {
              'category': selectedCategory,
              'description': description,
              'date': "${selectedDate.toLocal().toString().split(' ')[0]}",
              'time': selectedTime.format(context),
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please select a category, date, time, and enter a description')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(fontSize: 18),
        ),
        child: Text(widget.initialCategory == null ? "Add" : "Save"),
      ),
    );
  }
}
