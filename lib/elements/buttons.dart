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
