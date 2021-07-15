import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final gender;
  final result;
  final age;
  BmiResultScreen(
      {required this.gender, required this.result, required this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI result'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${gender == true ? 'Male' : 'female'}',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              'Result: ${result.round()}',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
