import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? firstNum;
  int? secondNum;
  String texttostring = "";
  String? res;
  String? operator;

  void btnClick(String value) {
    if (value == "c") {
      texttostring = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (value == "+" || value == "-" || value == "x" || value == "/") {
      firstNum = int.parse(texttostring);
      res = "";
      operator = value;
    } else if (value == "=") {
        secondNum = int.parse(texttostring);
        if (operator == "+") {
          res = (firstNum! + secondNum!).toString();
        }
        if (operator == "-") {
          res = (firstNum! - secondNum!).toString();
        }
        if (operator == "x") {
          res = (firstNum! * secondNum!).toString();
        }
        if (operator == "/") {
          res = (firstNum! ~/ secondNum!).toString();
        }
    } else {
      res = int.parse(texttostring + value).toString();
    }

    setState(() {
      texttostring = res!;
    });
  }

  Widget customerButton(String value) {
    return (Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClick(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttostring",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
            )),
            Row(
              children: <Widget>[
                customerButton("7"),
                customerButton("8"),
                customerButton("9"),
                customerButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                customerButton("4"),
                customerButton("5"),
                customerButton("6"),
                customerButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customerButton("1"),
                customerButton("2"),
                customerButton("3"),
                customerButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customerButton("c"),
                customerButton("0"),
                customerButton("="),
                customerButton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
