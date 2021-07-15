import 'package:flutter/material.dart';

class UserData {
  final int id;
  final String name;
  final String phone;

  UserData({required this.id, required this.name, required this.phone});
}

class User extends StatelessWidget {
  List<UserData> users = [
    UserData(id: 1, name: 'Mostafa Mahmoud', phone: '01024380419'),
    UserData(id: 2, name: 'Ahmed Mahmoud', phone: '015245421121'),
    UserData(id: 3, name: 'Khaled Mahmoud', phone: '010211445515'),
    UserData(id: 4, name: 'Mostafa Mahmoud', phone: '01024380419'),
    UserData(id: 5, name: 'Ahmed Mahmoud', phone: '015245421121'),
    UserData(id: 6, name: 'Khaled Mahmoud', phone: '010211445515'),
    UserData(id: 7, name: 'Mostafa Mahmoud', phone: '01024380419'),
    UserData(id: 8, name: 'Ahmed Mahmoud', phone: '015245421121'),
    UserData(id: 9, name: 'Khaled Mahmoud', phone: '010211445515'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) => buildUserItem(users[index]),
          separatorBuilder: (ctx, index) => Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              ),
          itemCount: users.length),
    );
  }
}

Widget buildUserItem(UserData user) => Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
            child: Text(
              '${user.id}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(
                user.phone,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
