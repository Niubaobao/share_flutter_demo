import 'package:flutter/material.dart';
//IndexedStack继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致。

class IndexedStackDemo extends StatefulWidget {
  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('IndexedStack Demo'),
          Container(
            color: Colors.yellow,
            child: IndexedStack(
              index: 0,
              children: [
                Image.network(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                  width: 100.0,
                ),
                Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                  child: Text('Container内容'),
                )
              ],
            ),
          ),
          Text('Stack Demo'),
          Stack(
            children: [
              Container(
                color: Colors.red.withOpacity(0.3),
                width: 200,
                height: 200,
                child: Text('Container内容'),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue).copyWith(color: Colors.black87),
                  // color: Colors.yellow,
                  height: 40,
                  width: 40,
                  child: Text('inner'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
