import "package:flutter/material.dart";

class ExerciseInputForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (val) {
              if (val == "1") {
                return null;
              }
              return "Empty String";
            },
            onSaved: (val) {
              print(val);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: RaisedButton(
              child: Text('submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var val = _formKey.currentState;
                  print(val.toString());
                  _formKey.currentState.save();
                } else {
                  print("error found");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
