/// 1画一个半径为10的黑圈
///
import 'package:flutter/material.dart';

class CustomCanvas extends StatefulWidget {
  @override
  _CustomCanvasState createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义canvas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              ///CustomPaint 组件可以用来显示绘制出的东西。
              child: CustomPaint(
                painter: PaperPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// 在这里面可以拿到画布Canvas
    ///

    // 创建画笔
    final Paint paint = Paint();
    // 绘制圆
    canvas.drawCircle(Offset(20, 20), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
