import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}




class _MyAppState extends State<MyApp>  {
  final TextEditingController _hcontroller = TextEditingController();
  final TextEditingController _wcontroller = TextEditingController();
  final TextEditingController _acontroller = TextEditingController();
  double h = 0.0, w = 0.0, a = 0.0, result = 0.0, cal = 0.0;
  int cal2 = 0, result2 = 0;
  var _gender = ['Male', 'Female'];
  var _currentGender = 'Male';
  var _exer = [
    'no exercise',
    '1-3 days/week',
    '4-5 days/week',
    '6-7 days/week',
    'very hard exercise',
  ];
  var _currentExer = 'no exercise';
  var _eqt = ['Miffin-St Jeor', 'Harris-Benedict'];
  var _currentEqt = 'Miffin-St Jeor';
  


  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentGender = newValueSelected;
    });
  }

  void _onDropDownItemSelected2(String newValueSelected) {
    setState(() {
      this._currentExer = newValueSelected;
    });
  }

  void _onDropDownItemSelected3(String newValueSelected) {
    setState(() {
      this._currentEqt = newValueSelected;
    });
  }

  void _calc() {
    setState(() {
      h = double.parse(_hcontroller.text);
      w = double.parse(_wcontroller.text);
      a = double.parse(_acontroller.text);
      result.toInt();
      if(this._currentEqt == 'Miffin-St Jeor'){
      if (this._currentGender == 'Male') {
        result = (10 * w) + (6.25 * h) - (5 * a) + 5;
        result2 = result.round();
      } else if (this._currentGender == 'Female') {
        result = (10 * w) + (6.25 * h) - (5 * a) - 161;
        result2 = result.round();
      }
      }
      else if(this._currentEqt == 'Harris-Benedict'){
      if (this._currentGender == 'Male') {
        result = 66.47 + (13.75*w) + (5.003*h) - (6.755*a);
        result2 = result.round();
      } else if (this._currentGender == 'Female') {
        result = 655.1 + (9.563*w) + (1.85*h) - (4.676*a);
        result2 = result.round();
      }
      }

      if (this._currentExer == 'no exercise') {
        cal = result * 1.2;
        cal2 = cal.round();
      } else if (this._currentExer == '1-3 days/week') {
        cal = result * 1.375;
        cal2 = cal.round();
      } else if (this._currentExer == '4-5 days/week') {
        cal = result * 1.55;
        cal2 = cal.round();
      } else if (this._currentExer == '6-7 days/week') {
        cal = result * 1.725;
        cal2 = cal.round();
      } else if (this._currentExer == 'very hard exercise') {
        cal = result * 1.9;
        cal2 = cal.round();
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('BMR Calculator'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text('Gender', style: TextStyle(fontSize: 18)),
              )),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                child: DropdownButton<String>(
                  items: _gender.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    _onDropDownItemSelected(newValueSelected);
                  },
                  value: _currentGender,
                ),
              )),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'BMR Equation',
                  style: TextStyle(fontSize: 18),
                ),
              )),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 250,
                child: DropdownButton<String>(
                  items: _eqt.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    _onDropDownItemSelected3(newValueSelected);
                  },
                  value: _currentEqt,
                ),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text('Height (cm)', style: TextStyle(fontSize: 18)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Height(cm)"),
                    controller: _hcontroller,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text('Weight (kg)', style: TextStyle(fontSize: 18)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Weight(kg)"),
                    controller: _wcontroller,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text(
                  'Age',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Age",
                    ),
                    controller: _acontroller,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
              ),
              Center(
                  child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 250,
                child: DropdownButton<String>(
                  items: _exer.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    _onDropDownItemSelected2(newValueSelected);
                  },
                  value: _currentExer,
                ),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text(
                  'BMR',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                
                child: Center(
                  child: Text(
                    "$result2",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 1,
                    ),
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Text(
                  'Daily Calories Needed',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                height: 40,
                width: 150,
                child: Center(
                  child: Text(
                    "$cal2",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              RaisedButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: _calc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
