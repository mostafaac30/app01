import 'package:app01/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:app01/modules/done_tasks/done_tasks_screen.dart';
import 'package:app01/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];

  List<String> text = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(await getName());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(text[currentIndex]),
      ),
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber[50],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_rounded),
            label: 'Archived',
          ),
        ],
      ),
    );
  }
}

Future<String> getName() async {
  return 'Msstafa';
}
