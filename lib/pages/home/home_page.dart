import 'package:first_demo/pages/main_page/main_page.dart';
import 'package:first_demo/pages/other_page/other_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // 可以放一些初始化操作
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();  // _controller销毁掉
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onItemTapped,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: [
          MainPage(),
          Otherpage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '其他页',
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    if(index ==_selectedIndex ) return ;

    _controller.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
