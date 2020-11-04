import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xhb_widget/xhb_widget.dart';

class Otherpage extends StatefulWidget {
  @override
  _OtherpageState createState() => _OtherpageState();
}

class _OtherpageState extends State<Otherpage> with AutomaticKeepAliveClientMixin{

  static const messageChannel = const BasicMessageChannel(
    'TEST',
    StringCodec(),
  );

  String str ;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              onPressed: (){
                messageChannel.setMessageHandler((message) async {
                  setState(() {
                    str = message;
                  });
                });
              },
              text: '点击接收原生方法 ${str}',
            ),
          ),
        ],
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;
}
