import 'package:flutter/material.dart';
import 'DBHelper.dart';
import 'Person.dart';
import 'dart:async';
import 'form.dart';
import 'list.dart';

class DBTestPage extends StatefulWidget {
  final String title;

  DBTestPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<DBTestPage> {
  var dbHelper = DBHelper();
  Future<List<Person>> employees;

  refreshList() {
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  void saveToDB(name, age, mobileNo) {
    var employee = Person(name, age, mobileNo);
    dbHelper.saveEmployee(employee);
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter SQLite Demo'),
        ),
        body: new Container(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
              MyForm(saveToDB),
              MyList(employees),
            ])));
  }
}
