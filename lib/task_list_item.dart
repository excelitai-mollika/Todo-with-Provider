import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model.dart';
import 'package:todo_app/provider.dart';


class TaskListItem extends StatelessWidget {
  final Task ?task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task!.completed,
        onChanged: (bool ?checked) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task!);
        },
      ),
      title: Text(task!.title!),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {


          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to remove the item?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('NO'),
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<TodosModel>(context, listen: false).deleteTodo(task!);
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text('Yes'))
                ],
              ));

        },
      ),
    );
  }
}