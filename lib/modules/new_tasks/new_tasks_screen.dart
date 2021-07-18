import 'package:app01/shared/componants/componants.dart';
import 'package:app01/shared/componants/constants.dart';
import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return defaultTaskItem(
            title: tasks[index]['title'],
            time: tasks[index]['time'],
            date: tasks[index]['date'],
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey[300],
          );
        },
        itemCount: tasks.length);
  }
}
