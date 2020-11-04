import 'dart:convert';

import 'package:first_demo/data/hotdata.dart';
import 'package:first_demo/pages/detail/content_detail.dart';
import 'package:first_demo/utils/utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  //AutomaticKeepAliveClientMixin 实现页面状态保存
  List<HotListData> list;

  @override
  void initState() {
    super.initState();
    loadDate();
  }

  void loadDate() {
    Utils.loadAsset('assets/data/zhihu.json').then((v) {
      List data = json.decode(v);

      List<HotListData> items = data.map((json) {
        return HotListData.fromJson(json);
      }).toList();

      setState(() {
        list = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: ListView.builder(
          itemCount: list?.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index);
          },
        ));
  }

  Widget _buildItem(int index) {
    if (list == null) return Text('');
    HotListData temp = list[index];

    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            child: Text(
              '${temp?.tmpIndex}',
              style: TextStyle(
                  color: int.parse(temp?.tmpIndex ?? 3) < 4
                      ? Color(0xFFFF9607)
                      : Color(0xFF999999)),
            ),
          ),
          _buildContent(temp),
          Image(
            image: NetworkImage(temp.tmpPicHref),
            width: 100.0,
            height: 66,
          )
        ],
      ),
    );
  }

  Widget _buildContent(HotListData temp) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ContentDetail(
                tmpHref: temp.tmpHref, tmpContent: temp.tmpContent)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 16),
        width: 202,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                '${temp?.tmpTitle}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF121212)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                '${temp?.tmpContent}',
                style: TextStyle(fontSize: 14, color: Color(0xFF444444)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(
                      Icons.hot_tub,
                      size: 14,
                    ),
                  ),
                  Text('${temp?.tmpHot}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
