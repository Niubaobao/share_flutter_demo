import 'package:first_demo/pages/canvas/custom_canvas.dart';
import 'package:first_demo/widgets/global_demo.dart';
import 'package:first_demo/widgets/indexed_stack/indexed_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xhb_widget/xhb_widget.dart';
import 'stack1.dart'; //可以这样导入但是这样导入不是很好 因为一旦路径改变了需要重新导入新路径

class Otherpage extends StatefulWidget {
  @override
  _OtherpageState createState() => _OtherpageState();
}

class _OtherpageState extends State<Otherpage> {
  //
  GlobalKey<GlobalDemoState> _scaffoldkey = GlobalKey<GlobalDemoState>();

  static const messageChannel = BasicMessageChannel(
    'TEST',
    StringCodec(),
  );
  String str;

  @override
  void initState() {
    print('别的页面');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('引用公共Ui'),
      ),
      body: Center(
          child: Column(
        children: [
          XhbInput(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: PrimaryButton(
              onPressed: () {
                messageChannel.setMessageHandler((message) async {
                  setState(() {
                    str = message;
                  });
                });
              },
              text: '点击接收原生方法 $str',
            ),
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => IndexedStackDemo(),
                ),
              );
            },
            text: 'IndexedStack',
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => CustomCanvas(),
                ),
              );
            },
            text: '点击跳转canvas',
          ),
          Icon(
            Icons.android,
          ),
          RichText(
            text: TextSpan(
              text: '这是什么',
              style: TextStyle(color: Colors.red),
              children: [
                TextSpan(
                    text: '???????', style: TextStyle(color: Colors.yellow)),
                TextSpan(text: '鬼东西啊', style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
          GlobalDemo(
            key: _scaffoldkey,
          ),
          PrimaryButton(
            onPressed: () {
              print(_scaffoldkey);
              print(_scaffoldkey.currentState.context.findRenderObject());
              _scaffoldkey.currentState.changeState();
              print(_scaffoldkey.currentState.context.size);
            },
            text: '通过Globalkey改变widget状态',
          )
        ],
      )),
    );
  }
}
