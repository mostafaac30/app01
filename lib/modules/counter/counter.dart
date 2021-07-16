import 'package:app01/modules/counter/cubit/cubit.dart';
import 'package:app01/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: (Text("Mostafa's Counter")),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "This",
                      style: TextStyle(
                          color: Colors.cyan,
                          backgroundColor: Colors.orange[50],
                          fontSize: 22),
                    ),
                    RaisedButton(
                      onPressed: () {
                        CounterCubit.getCubitOjb(context).remove();
                      },
                      child: Text("Decrease"),
                      color: Colors.red,
                      textColor: Colors.deepPurple,
                      splashColor: Colors.blue,
                      highlightColor: Colors.amber,
                      padding: EdgeInsets.all(20),
                    ),
                    Text(
                      'counter: ${CounterCubit.getCubitOjb(context).counter}',
                      style: TextStyle(
                          color: Colors.red,
                          backgroundColor: Colors.red[50],
                          fontSize: 30),
                    ),
                    FlatButton(
                      disabledColor: Colors.deepPurple,
                      child: Text(
                        "flat",
                        style: TextStyle(color: Colors.red[50], fontSize: 30),
                      ),
                      onPressed: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red, width: 3.0)),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  CounterCubit.getCubitOjb(context).add();
                },
                child: Icon(Icons.add),
              ),
            );
          }),
    );
  }
}
