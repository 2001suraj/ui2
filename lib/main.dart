import 'package:uui/ui/bmi/bmi_calculator.dart';
import 'package:uui/ui/todo/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "more ui's",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffol(),
    );
  }
}

class Scaffol extends StatelessWidget {
  const Scaffol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ui's"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BMICalculator()));
            },
            child: Text("BMI calculator"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodoLoginScreen()));
            },
            child: Text("to do"),
          ),
        ]),
      ),
    );
  }
}
