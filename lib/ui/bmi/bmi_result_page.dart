import 'package:flutter/material.dart';
import 'package:uui/ui/bmi/bmi_calculator.dart';

class BMIResultPage extends StatelessWidget {
  String result;
  String inforesult;
  String inforange;

  String inforesultdetails;

  BMIResultPage({required this.result, required this.inforesult,required this.inforesultdetails,required this.inforange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 104, 162, 209),
      appBar: AppBar(
        title: Text("BMI Caluclator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text("Your Result",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
           Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                decoration: BoxDecoration(
              color: Color.fromARGB(255, 29, 94, 148),
                  borderRadius: BorderRadius.circular(20),
            ), 
                width:double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: [
                    Text(
                      inforesult,
                      style: TextStyle(
                          color: Colors.greenAccent,
                       fontWeight: FontWeight.bold,
                          fontSize: 25),
               ),
                    Text(
                      result,
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 14, 8),
                          fontWeight: FontWeight.bold,
                          fontSize: 85),
                    ),
                    SizedBox(height: 20),
                    Text(
                     inforesult + "  BMI Range :",
                      style: TextStyle(
                          color: Color.fromARGB(255, 30, 31, 30),
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      inforange,
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 13, 22),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      inforesultdetails,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color.fromARGB(255, 36, 11, 25),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: () {},
                      child: Text("Save Result",
                          style: TextStyle(
                              color: Color.fromARGB(66, 252, 252, 253))),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BMICalculator()));
              },
              child: Text("Re-calculate your BMI"),
            ),
          ],
        ),
      ),
    );
  }
}
 