import 'package:flutter/material.dart';
import 'tasks_tiles.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class AllTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTiles(
                deleteTile: () {
                  taskData.deleteTask(index);
                },
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallback: (bool? checkBoxState) {
                  taskData.updateTask(task);
                });
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
