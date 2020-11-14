import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  final String tmpContent;
  final String tmpHref;

  ContentDetail({this.tmpContent, @required this.tmpHref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                tmpHref ?? '默认tmpHref',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              child: Text(tmpContent ?? '默认tmpContent'),
            )
          ],
        ),
      ),
    );
  }
}
