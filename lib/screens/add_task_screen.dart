import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? newValue;

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2c3940),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    color: Colors.teal),
              ),
              TextField(

                controller: _controller,
                style: const TextStyle(color: Colors.tealAccent),
                cursorColor: Colors.teal,
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (value) {
                  newValue = value;
                  print(newValue);
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controller.clear();
                        newValue = null;
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "Enter your task here!",
                    hintStyle:const  TextStyle(color: Colors.tealAccent)),
              ),
              TextButton(
                onPressed: () {
                  newValue == null
                      ? null
                      : Provider.of<TaskData>(context, listen: false)
                          .addTaskData(newValue!);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.teal,
                  width: double.infinity,
                  child: Text(
                    "Add",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey[900], fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
