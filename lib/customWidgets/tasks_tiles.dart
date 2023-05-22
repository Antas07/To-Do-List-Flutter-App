import 'package:flutter/material.dart';

class TaskTiles extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final void Function(bool?) checkBoxCallback;
  final void Function()? deleteTile;
  const TaskTiles(
      {this.isChecked,
      required this.taskTitle,
      required this.checkBoxCallback,
      this.deleteTile});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      //subtitle: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
      horizontalTitleGap: 1,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: IconButton(
          onPressed: deleteTile,
          icon: Icon(
            Icons.close,
            color: Colors.blueGrey[900],
          ),
        ),
        //onLongPress: deleteTile,
        title: Text(
          taskTitle!,
          style: TextStyle(
            letterSpacing: 1,
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              decoration: isChecked! ? TextDecoration.lineThrough : null,
              decorationColor: Colors.teal,
              decorationStyle: TextDecorationStyle.wavy,
              decorationThickness: 2,
              color: Colors.blueGrey[900]),
        ),
        trailing: Checkbox(
            value: isChecked,
            activeColor: Colors.green,
            onChanged: checkBoxCallback));
  }
}
