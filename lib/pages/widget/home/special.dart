/**
 * 超值特惠
 */

import 'package:flutter/material.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
import 'package:flutter_trip_app/common/constraints/sys_style.dart';

class Special extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(
          horizontal: SysStyle.mainHorizontalPadding, vertical: 10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          header(),
          body(context),
          footer(),
        ],
      ),
    );
  }

  TextStyle getTextStyle({double fontSize, Color color}) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
      color: color,
    );
    return style;
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text('超值特惠', style: getTextStyle(fontSize: 24)),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '更多',
                  style: getTextStyle(fontSize: 16, color: Colors.grey),
                ),
                Icon(
                  SysIcons.JianTou_Right,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: leftCell(context),
        ),
        Expanded(
          child: rightCell(),
        ),
      ],
    );
  }

  Widget leftCell(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // gradient: RadialGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)],radius: 1, tileMode: TileMode.mirror),
        gradient: LinearGradient(
          colors: [Colors.red[100], Colors.red[200], Colors.red],
          begin: FractionalOffset(1, 1),
          end: FractionalOffset(1, 0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '旅游特惠',
            textAlign: TextAlign.left,
            style: getTextStyle(fontSize: 20, color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3932546523,304539533&fm=26&gp=0.jpg',
                  fit: BoxFit.fitWidth,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    '哈哈哈哈哈很好玩暗暗啊啊哈哈哈哈哈很好玩暗暗啊啊',
                    maxLines: 2,
                    style: getTextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '￥',
                        style: getTextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        '180.00',
                        style: getTextStyle(
                            fontSize: 24, color: Color(SysStyle.mainColor)),
                      ),
                      Text(
                        '起',
                        style: getTextStyle(
                            fontSize: 12, color: Color(SysStyle.mainColor)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rightCell() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // gradient: RadialGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)],radius: 1, tileMode: TileMode.mirror),
        gradient: LinearGradient(
          colors: [
            Colors.blue[100],
            Colors.blue[200],
            Colors.blue,
          ],
          begin: FractionalOffset(1, 1),
          end: FractionalOffset(1, 0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '特价机票',
                textAlign: TextAlign.left,
                style: getTextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(SysIcons.JianTou_Right, color: Colors.white)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ticket(),
              ticket(),
            ],
          ),
        ],
      ),
    );
  }

  Widget ticket() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text('北京 -> 上海'),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text('7.8折'),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '￥',
                      style: getTextStyle(
                          fontSize: 12, color: Color(SysStyle.mainColor)),
                    ),
                    Text(
                      '470',
                      style: getTextStyle(
                          fontSize: 20, color: Color(SysStyle.mainColor)),
                    ),
                    Text(
                      '起',
                      style: getTextStyle(
                          fontSize: 12, color: Color(SysStyle.mainColor)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget footer() {
    Widget cell({String title, String desc,Color background}) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title),
              Text(desc),
            ],
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cell(title:"特价酒店", desc:"限时抢购",background:Colors.white),
        cell(title:"特价旅游", desc:"超值3折起",background:Colors.white),
        cell(title:"私家团", desc:"最高减1000",background:Colors.white),
      ],
    );
  }
}
