import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: distanceController,
                  decoration: InputDecoration(
                      labelText: 'Distance',
                      hintText: 'e.g. 124',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                  controller: avgController,
                  decoration: InputDecoration(
                      labelText: 'Distance per Unit',
                      hintText: 'e.g. 17',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: Row(children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'e.g. 1.65',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                  )),
                  Container(width: _formDistance * 5),
                  Expanded(
                      child: CurrencyDropdownButton(
                          dropdownSetValue: _onDropDownChanged,
                          itemValue: _currency,
                          itemsList: _currencies))
                ])),
            Row(children: <Widget>[
              Expanded(
                  child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Submit',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          result = _calculate();
                        });
                      })),
              Container(width: _formDistance * 5),
              Expanded(
                  child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      }))
            ]),
            Text(result)
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

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);

    double _totalCost = (_distance / _consumption) * _fuelCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset() {
    distanceController.clear();
    priceController.clear();
    avgController.clear();
    _currency = 'Dollars';
    setState(() {
      result = '';
    });
  }
}

class CurrencyDropdownButton extends StatelessWidget {
  CurrencyDropdownButton(
      {Key key, this.dropdownSetValue, this.itemValue, this.itemsList})
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
