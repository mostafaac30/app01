import 'package:flutter/material.dart';
import '../../shared/componants/my_flutter_app_icons.dart';

class DataModel {
  Color color;
  String tip;
  DataModel({required this.color, required this.tip});
}

TextStyle stl = TextStyle(
    color: Color.fromRGBO(94, 122, 125, 1),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'SpaceMono',
    letterSpacing: 5.0);
TextStyle stl2 = TextStyle(
  color: Color.fromRGBO(94, 122, 125, 1),
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'SpaceMono',
);
TextStyle stl3 = TextStyle(
  color: Color.fromRGBO(244, 250, 250, 1),
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'SpaceMono',
);
TextStyle stl4 = TextStyle(
  color: Color.fromRGBO(244, 250, 250, 1),
  fontSize: 17.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'SpaceMono',
);

TextStyle stl5 = TextStyle(
  color: Color.fromRGBO(38, 192, 171, 1),
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'SpaceMono',
);

TextStyle stl6btn = TextStyle(
    color: Color.fromRGBO(0, 73, 77, 1),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'SpaceMono',
    letterSpacing: 5.0);

var priceController = TextEditingController();
var tipController = TextEditingController();
var peopleNumberController = TextEditingController();
int? price;
int? numberOfPeople = 1;
double? tipPerPerson = 0.0;
double? tipPrecent = 0.0;
double? total = 0.0;
bool firstClick = true;
bool firstCustom = true;

int? colorIndex = 0;

List<DataModel> buttonData = [
  DataModel(color: Color.fromRGBO(0, 73, 77, 1), tip: '5'),
  DataModel(color: Color.fromRGBO(0, 73, 77, 1), tip: '10'),
  DataModel(color: Color.fromRGBO(0, 73, 77, 1), tip: '15'),
  DataModel(color: Color.fromRGBO(0, 73, 77, 1), tip: '25'),
  DataModel(color: Color.fromRGBO(0, 73, 77, 1), tip: '50'),
];
//Color.fromRGBO(38, 192, 171, 1)

class Splitter extends StatefulWidget {
  @override
  _SplitterState createState() => _SplitterState();
}

class _SplitterState extends State<Splitter> {
  void tipPP() {
    if (priceController.text != '' &&
        tipPrecent != null &&
        (peopleNumberController.text != '' &&
            !peopleNumberController.text.contains('.'))) {
      setState(() {
        tipPerPerson = double.tryParse(priceController.text)! *
            (tipPrecent! / 100) /
            int.tryParse(peopleNumberController.text)!;
        tipPerPerson = double.tryParse(tipPerPerson!.toStringAsPrecision(3));
      });
    }
  }

  void totalPP() {
    if (priceController.text != '' &&
        (peopleNumberController.text != '' &&
            !peopleNumberController.text.contains('.')))
      setState(() {
        total = double.tryParse(priceController.text)! /
                int.tryParse(peopleNumberController.text)! +
            tipPerPerson!;
        total = double.tryParse(total!.toStringAsPrecision(4));
      });
  }

  void resetFunItem() {
    setState(() {
      priceController.text = '';
      tipController.text = '';
      peopleNumberController.text = '';
      tipPrecent = 0;
      firstClick = true;
      tipPerPerson = 0;
      total = 0;
      firstCustom = true;
    });
  }

  reset() {
    if (!firstClick) {
      pre();
      resetFunItem();
    } else if (!firstCustom) resetFunItem();
  }

  void pre() {
    setState(() {
      tipPrecent = double.tryParse(buttonData[colorIndex!].tip);
      buttonData[colorIndex!].color =
          buttonData[colorIndex!].color == Color.fromRGBO(0, 73, 77, 1)
              ? Color.fromRGBO(38, 192, 171, 1)
              : Color.fromRGBO(0, 73, 77, 1);
      tipController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(197, 228, 231, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(197, 228, 231, 1),
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              Text('SPLI', style: stl),
              Text('TTER', style: stl),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18.0),
            topEnd: Radius.circular(18.0),
          ),
          color: Colors.white,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bill', style: stl2),
                SizedBox(height: 10.0),
                //BillTFF
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 250, 250, 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    controller: priceController,
                    onChanged: (value) {
                      tipPP();
                      totalPP();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: stl2,
                      prefixIcon: Icon(MyFlutterApp.icon_dollar),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Text('Select Tip %', style: stl2),
                SizedBox(height: 15.0),
                //precent
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 130.0,
                            height: 45.0,
                            margin: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () {
                                if (!firstClick) pre();
                                firstClick = false;

                                colorIndex = 0;
                                pre();
                                totalPP();
                                tipPP();
                              },
                              color: buttonData[0].color,
                              child: Text(
                                '5%',
                                style: stl3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Container(
                            width: 130.0,
                            height: 45.0,
                            margin: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () {
                                if (!firstClick) pre();
                                firstClick = false;

                                colorIndex = 1;
                                pre();
                                totalPP();
                                tipPP();
                              },
                              color: buttonData[1].color,
                              child: Text(
                                '10%',
                                style: stl3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 130.0,
                            height: 45.0,
                            margin: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () {
                                if (!firstClick) pre();
                                firstClick = false;

                                colorIndex = 2;
                                pre();
                                totalPP();
                                tipPP();
                              },
                              color: buttonData[2].color,
                              child: Text(
                                '15%',
                                style: stl3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Container(
                            width: 130.0,
                            height: 45.0,
                            margin: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () {
                                if (!firstClick) pre();
                                firstClick = false;

                                colorIndex = 3;
                                pre();
                                totalPP();
                                tipPP();
                              },
                              color: buttonData[3].color,
                              child: Text(
                                '25%',
                                style: stl3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 130.0,
                            height: 45.0,
                            margin: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: () {
                                if (!firstClick) pre();
                                firstClick = false;

                                colorIndex = 4;
                                pre();
                                totalPP();
                                tipPP();
                              },
                              color: buttonData[4].color,
                              child: Text(
                                '50%',
                                style: stl3,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(244, 250, 250, 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              controller: tipController,
                              onChanged: (value) {
                                //when MB clicked and custom not used before
                                if (firstCustom && !firstClick)
                                  pre(); //to remove selection color
                                firstClick = true;
                                firstCustom = false;
                                tipPrecent =
                                    double.tryParse(tipController.text);

                                tipPP();
                                totalPP();
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Custom',
                                hintStyle: stl,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                Text('Number of People', style: stl2),
                SizedBox(height: 10.0),
                //#ofPeople
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 250, 250, 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    controller: peopleNumberController,
                    onChanged: (value) {
                      tipPP();
                      totalPP();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: stl2,
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(0, 73, 77, 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Tip Amount', style: stl4),
                              Text('/ person', style: stl2)
                            ],
                          ),
                          Expanded(
                              child: Text(
                            '\$$tipPerPerson',
                            style: stl5,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Total', style: stl4),
                              Text('/ person', style: stl2)
                            ],
                          ),
                          Expanded(
                            child: Text(
                              '\$$total',
                              style: stl5,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        height: 45.0,
                        margin: EdgeInsets.only(bottom: 15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: () {
                            reset();
                          },
                          color: Color.fromRGBO(38, 192, 171, 1),
                          child: Text(
                            'RESET',
                            style: stl6btn,
                          ),
                        ),
                      ),
                      Text(
                        '☕ By Mostafa Mahmoud',
                        style: stl3,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
