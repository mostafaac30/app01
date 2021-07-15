import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  List li = [
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
    {'name': 'ahmed', 'date': DateTime.now()},
  ];

  void sheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return ListView.builder(
              itemCount: li.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.deepOrange,
                    elevation: 10,
                    shadowColor: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          (li[index])['name'],
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontFamily: 'Quicksand',
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '${DateFormat('yyy-MMM-dd').format((li[index])['date'])}',
                        )
                      ],
                    ));
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.slideshow),
        title: Text(
          "Records app",
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('notifications');
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search');
              }),
        ],
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.indigo,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(8.0), topEnd: Radius.circular(8.0)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                height: 300,
                width: 300,
                image: NetworkImage(
                    'https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                fit: BoxFit.cover,
              ),
              Container(
                width: 300,
                color: Colors.black.withOpacity(0.6),
                child: Text(
                  'Flower',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontFamily: 'Quicksand',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => sheet(context),
      ),
    );
  }
}
