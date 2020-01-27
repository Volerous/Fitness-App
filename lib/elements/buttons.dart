import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.text, this.radius = 50.0});
  final String text;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: Colors.blue,
          ),
        ),
        child: Center(
          child: Text(this.text),
        ),
      ),
    );
  }
}

class MetricDropDown extends StatefulWidget {
  @override
  _MetricDropDownState createState() => _MetricDropDownState();
}

class _MetricDropDownState extends State<MetricDropDown> {
  String dropDownValue = "kg";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      items: <String>["kg", "sec", "%"].map((String i) {
        return DropdownMenuItem(
          value: i,
          child: Text(i),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          dropDownValue = value;
        });
      },
    );
  }
}

