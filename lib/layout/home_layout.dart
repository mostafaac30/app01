import 'package:app01/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:app01/modules/done_tasks/done_tasks_screen.dart';
import 'package:app01/modules/new_tasks/new_tasks_screen.dart';
import 'package:app01/shared/componants/componants.dart';
import 'package:app01/shared/componants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:conditional_builder/conditional_builder.dart';

Database? dataB;

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

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> text = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  var taskController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  bool isBtmSheetShown = false;

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBtmSheetShown && formKey.currentState!.validate()) {
            insertIntoDataB(
                    title: taskController.text,
                    date: dateController.text,
                    time: timeController.text)
                .then((value) {
              isBtmSheetShown = !isBtmSheetShown;
              setState(() {});
              Navigator.pop(context);
            });
          } else {
            isBtmSheetShown = !isBtmSheetShown;
            setState(() {}); //to show second icon

            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultTFF(
                              label: 'add task',
                              prefix: Icons.title,
                              inputType: TextInputType.text,
                              controller: taskController,
                              validate: (String? value) {
                                if (value!.isEmpty)
                                  return 'error input task title';
                                return null;
                              },
                              ontap: () {}),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTFF(
                              label: 'add time',
                              prefix: Icons.watch_later_outlined,
                              inputType: TextInputType.datetime,
                              controller: timeController,
                              validate: (String? value) {
                                if (value!.isEmpty)
                                  return 'error input task time';
                                return null;
                              },
                              ontap: () {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) => timeController.text =
                                        value!.format(context).toString());
                              }),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultTFF(
                              label: 'add date',
                              prefix: Icons.calendar_today_outlined,
                              inputType: TextInputType.datetime,
                              controller: dateController,
                              validate: (String? value) {
                                if (value!.isEmpty)
                                  return 'error input task date';

                                return null;
                              },
                              ontap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2021-11-03'))
                                    .then((value) => dateController.text =
                                        DateFormat.yMMMd()
                                            .format(value!)
                                            .toString());
                              })
                        ],
                      ),
                    ),
                  ),
                )
                .closed
                .then((value) {
              if (formKey.currentState!.validate()) {
                isBtmSheetShown = !isBtmSheetShown;
                setState(() {});
              }
            });
          }
        },
        child: isBtmSheetShown ? Icon(Icons.add) : Icon(Icons.edit),
      ),
      appBar: AppBar(
        title: Text(text[currentIndex]),
      ),
      body: ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context) => screen[currentIndex],
        fallback: (context) {
          return Center(child: CircularProgressIndicator());
        },
      ),
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

void createDB() async {
  dataB = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (dataB, version) {
      print('dataB is successfuly created');
      dataB
          .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('Table is successfuly created');
      }).catchError((error) {
        print('error when creatring table $error');
      });
    },
    onOpen: (dataBase) async {
      print('dataB is successfuly opend');
      tasks = await getDataFromDB(dataBase).then((value) {
        print('DB is $value');
        return tasks = value;
      });
    },
  );
}

//
Future insertIntoDataB({
  required String title,
  required String date,
  required String time,
}) async {
  return await dataB!.transaction((txn) {
    txn
        .rawInsert(
            'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")')
        .then((value) => print('values inserted successfuly'))
        .catchError((error) {
      print('error when insertion');
    });
    return null;
  });
}

Future<List<Map>> getDataFromDB(Database dataB) async {
  return dataB.rawQuery('SELECT * FROM tasks');
}
