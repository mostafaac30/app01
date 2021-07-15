import 'dart:math';

import 'package:app01/modules/bmi_result/bmiResult_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  TextStyle stl = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
  bool isMale = true;
  double height = 120.0;
  int age = 30;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI calculator',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                    isMale = true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isMale ? Colors.blue : Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/male.png'),
                          height: 90.0,
                          width: 90.0,
                        ),
                        Text('MALE', style: stl),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: !isMale ? Colors.blue : Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {});
                      isMale = false;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/female.png'),
                          height: 90.0,
                          width: 90.0,
                        ),
                        Text(
                          'FEMALE',
                          style: stl,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          //section 2
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'HIGHT',
                  style: stl,
                ),
                SizedBox(height: 8.0),
                //heightValue
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${height.round()}',
                      style: stl,
                    ),
                    Text('cm')
                  ],
                ),
                SizedBox(height: 8.0),
                //slider
                Slider(
                  value: height,
                  onChanged: (val) {
                    setState(() {
                      height = val;
                    });
                  },
                  min: 80.0,
                  max: 220.0,
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: stl,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '$weight',
                        style: stl,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            heroTag: 'w--',
                            mini: true,
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            heroTag: 'w++',
                            mini: true,
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Age',
                        style: stl,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '$age',
                        style: stl,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            heroTag: 'a--',
                            mini: true,
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            heroTag: 'a++',
                            mini: true,
                            child: Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Container(
              color: Colors.redAccent,
              width: double.infinity,
              height: 50.0,
              child: MaterialButton(
                  onPressed: () {
                    double result = weight / pow(height / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiResultScreen(
                              gender: isMale, result: result, age: age),
                        ));
                  },
                  child: Text('Calculate'))),
        ],
      ),
    );
  }
}
