import 'package:flutter/material.dart';

class GlobalDemo extends StatefulWidget {
  GlobalDemo({Key key}) : super(key: key);
  @override
  GlobalDemoState createState() => GlobalDemoState();
}

class GlobalDemoState extends State<GlobalDemo> {
  int count = 0;

  changeState() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          count++;
          setState(() {});
        },
        child: Text('点击+++ $count'),
      ),
    );
  }
}
