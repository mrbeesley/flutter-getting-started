import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black87,
        child: Center(
          child: new Text(
            sayHello(),
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 36.0),
          ),
        ));
  }

  String sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    int minute = now.minute;

    if (hour < 12) {
      hello = "Good Morning from Flutter!";
    } else if (hour < 18) {
      hello = "Good Afternoon from Flutter!";
    } else {
      hello = "Good Evening from Flutter!";
    }

    String minutes =
        (minute < 10) ? "0" + minute.toString() : minute.toString();
    
    return "It's now " + hour.toString() + ":" + minutes + " " + hello;
  }
}
