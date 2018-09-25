import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  final formKey = new GlobalKey<FormState>();

  final Function saveToDB;

  MyForm(this.saveToDB);

  @override
  State<StatefulWidget> createState() {
    return _MyFormState();
  }
}

class _MyFormState extends State<MyForm> {
  String name;
  String age;
  String mobileNo;

  validate() {
    if (widget.formKey.currentState.validate()) {
      widget.formKey.currentState.save();
    }
    widget.saveToDB(name, age, mobileNo);
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: widget.formKey,
        child: new Padding(
            padding: new EdgeInsets.all(28.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(labelText: 'First Name'),
                    validator: (val) =>
                        val.length == 0 ? "Enter FirstName" : null,
                    onSaved: (val) => name = val,
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(labelText: 'Age'),
                    validator: (val) => val.length == 0 ? "Enter Age" : null,
                    onSaved: (val) => this.age = val,
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(labelText: 'Mobile Number'),
                    validator: (val) =>
                        val.length == 0 ? "Enter mobile number" : null,
                    onSaved: (val) => this.mobileNo = val,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: new RaisedButton(
                      onPressed: validate,
                      child: new Text('SAVE'),
                    ),
                  )
                ])));
  }
}
