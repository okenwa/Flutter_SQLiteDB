import 'package:flutter/material.dart';

class ListRow extends StatefulWidget {
  final String name;
  final String age;
  final String mobileNo;

  ListRow(this.name, this.age, this.mobileNo);

  @override
  State<StatefulWidget> createState() {
    return _ListRowState();
  }
}

class _ListRowState extends State<ListRow> {
  TextStyle getTextStyle() {
    return new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);
  }

  Padding getRowText(value) {
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: Text(value, style: getTextStyle()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        getRowText(widget.name),
        getRowText(widget.age),
        getRowText(widget.mobileNo),
      ],
    );
  }
}
