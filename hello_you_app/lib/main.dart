import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello You',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HelloYou(),
    );
  }
}

class HelloYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Please insert your name.'),
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            HelloYouDropdownButton(
              dropdownSetValue: _onDropDownChanged,
              itemValue: _currency,
              itemsList: _currencies
            ),
            Text('Hello ' + name + '!')
          ],
        ),
      ),
    );
  }

  _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }
}

class HelloYouDropdownButton extends StatelessWidget {
  HelloYouDropdownButton({Key key, this.dropdownSetValue, this.itemValue, this.itemsList})
      : super(key: key);
  final void Function(String value) dropdownSetValue;
  String itemValue;
  List<String> itemsList;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: itemsList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: itemValue,
      onChanged: (String value) => dropdownSetValue(value),
    );
  }
}
