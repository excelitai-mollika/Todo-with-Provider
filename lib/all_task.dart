import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider.dart';
import 'package:todo_app/task_list.dart';


class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
          tasks: todos.allTasks,
        ),
      ),
    );
  }
}
