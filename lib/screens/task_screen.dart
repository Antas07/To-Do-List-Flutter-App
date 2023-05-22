import 'package:flutter/material.dart';
import 'package:todo_list/customWidgets/tasks_lists.dart';
import 'package:todo_list/models/task_data.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    Provider.of<TaskData>(context, listen: false).getitemFromLocalStorage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ),
                );
              });
        },
        backgroundColor: Colors.tealAccent,
        child: Icon(
          Icons.add,
          color: Colors.blueGrey[900],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 30.0,
                  child: Icon(
                    Icons.work,
                    size: 40.0,
                    color: Colors.blueGrey[900],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'ToDo List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} Tasks",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.teal, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              height: 300.0,
              child: AllTaskList(),
            ),
          )
        ],
      ),
    );
  }
}
