import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'task.dart';
import 'package:collection/collection.dart' show UnmodifiableListView;

class TaskData extends ChangeNotifier {
  final LocalStorage storage = LocalStorage('todo_list');
  List<dynamic> taskNames = [];

  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTaskData(String newTask) {
    _tasks.add(Task(name: newTask));
    taskNames.add(newTask);
    storage.setItem(newTask, {newTask: newTask, 'state': false});
    storage.setItem("taskNames", taskNames);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    storage.setItem(task.name!, {task.name: task.name, 'state': task.isDone});
    notifyListeners();
  }

  void deleteTask(int delTaskIndex) {
    _tasks.removeAt(delTaskIndex);
    storage.deleteItem(taskNames[delTaskIndex]);
    taskNames.removeAt(delTaskIndex);
    notifyListeners();
  }

  void getitemFromLocalStorage() async {
    LocalStorage storage = LocalStorage('todo_list');
    await storage.ready;
    taskNames = await storage.getItem('taskNames');
    _tasks = [];
    for (int i = 0; i < taskNames.length; i++) {
      _tasks.add(Task(
          name: taskNames[i], isDone: storage.getItem(taskNames[i])['state']));
      notifyListeners();
    }
  }
}
