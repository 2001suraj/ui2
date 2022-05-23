import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uui/ui/bmi/bmi_result_page.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int initial_weight = 50;
  int initial_age = 50;
  double height = 180;
  late double _bmi;
  String result() {
    _bmi = initial_weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getresult() {
    if (_bmi <= 18.5) {
      return "	Underweight";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " Normal";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " Overweight";
    } else {
      return "	Obese";
    }
  }

  getresultdetails() {
    if (_bmi <= 18.5) {
      return "	If your BMI is less than 18.5, then it means that you are underweight.To avoid health complications that may arise due to low levels of body fat,you need to put on more weight.Make sure you get in touch with your doctor or a dietician for professional insight and advice.";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " If you have a BMI that falls in between 18.5 to 22.9, then it means that you have a healthy weight in relation to your height. This is your normal BMI range. When you maintain a healthy level of body fat,it means that you have a much lower risk of developing health complications.";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " If you have a BMI that falls in between 23.0 to 24.9, it means that you are overweight.In other words,you have a higher than ideal level of body fats considering your height.In such cases,it is important that you lose some amount of weight in order to improve your health. It is recommended that you talk to a doctor or dietician for professional advice.";
    } else {
      return "If your BMI is more than 25.0, then it indicates that you are obese,or in other words,heavily overweight.It is far from your ideal BMI and it means that you have way too much body fat in relation to your height,and this can pose serious health risks. It is important that you lose weight for health reasons. Make sure to contact your doctor or dietician for professional advice in such a situation.";
    }
  }

  getRange() {
    if (_bmi <= 18.5) {
      return "	below 18.5 kg/m2";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " 18.5 - 22.9 kg/m2";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " 23 - 24.9 kg/m2";
    } else {
      return "	25 and above kg/m2";
    }
  }

  static const inactive = Color.fromARGB(255, 78, 52, 150);
  static const active = Color.fromARGB(255, 25, 15, 51);
  Color maleColor = inactive;
  Color femaleColor = active;
  c(int gender) {
    if (gender == 1) {
      if (maleColor == inactive) {
        maleColor = active;
        femaleColor = inactive;
      }
    } else {
              maleColor = inactive;

    }
    if (gender == 2) {
      if (femaleColor == inactive) {
        femaleColor = active;
        maleColor = inactive;
      }
    } else {
              femaleColor = inactive;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 26, 73),
        elevation: 0,
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 5, 26, 73),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        c(1);
                      });
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.27,
                      decoration: BoxDecoration(
                        color: maleColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 90, color: Colors.white),
                          Text(
                            "male",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        c(2);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.27,
                      height: 200,
                      decoration: BoxDecoration(
                        color: femaleColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 90, color: Colors.white),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 78, 52, 150),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 250,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          height.toString() + " cm",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        SizedBox(height: 30),
                        Slider(
                            max: 240,
                            min: 50,
                            value: height,
                            onChanged: (double value) {
                              setState(() {
                                height = value.roundToDouble();
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.27,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 78, 52, 150),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Weight",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          Text(initial_weight.toString(),
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "btn1",
                                onPressed: () {
                                  setState(() {
                                    initial_weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              SizedBox(width: 20),
                              FloatingActionButton(
                                heroTag: "btn2",
                                onPressed: () {
                                  setState(() {
                                    initial_weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.27,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 78, 52, 150),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Age",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          Text(initial_age.toString(),
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "btn3",
                                onPressed: () {
                                  setState(() {
                                    initial_age++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              SizedBox(width: 20),
                              FloatingActionButton(
                                heroTag: "btn4",
                                onPressed: () {
                                  setState(() {
                                    initial_age--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 90),
                onPressed: () {
                  var cal = result();
                  var info = getresult();
                  var detail = getresultdetails();
                  var range = getRange();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIResultPage(
                                inforesultdetails: "$detail",
                                result: "$cal",
                                inforesult: "$info",
                                inforange: "$range",
                              )));
                },
                color: Colors.lightGreenAccent,
                child: Text("Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
