import 'package:flutter/material.dart';
import 'package:flutter_trip_app/common/constraints/sys_style.dart';
import 'package:flutter_trip_app/common/constraints/sys_icons.dart';
class SubMenu  extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    Container getItemColumn(String text,IconData iconData) {
      return new Container(
        // margin: EdgeInsets.all(5.0),
        width: 90.0,
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Icon(iconData,size: 30.0,color: Color(SysStyle.mainColor),),
            new Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new Text(
                text,
                style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      );
    }
    return new Container(
      padding: const EdgeInsets.symmetric(horizontal: SysStyle.mainHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getItemColumn('自由行',SysIcons.CUSTOM_TRAVEL),
              getItemColumn('WiFi电话卡',SysIcons.WiFi),
              getItemColumn('保险.签证',SysIcons.INSURANCE),
              getItemColumn('换钞.购物',SysIcons.SHOPING),
              getItemColumn('当地向导',SysIcons.GUIDE),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getItemColumn('特价机票',SysIcons.AIR_TICKET),
              getItemColumn('礼品卡',SysIcons.GIFT_CARD),
              getItemColumn('申卡.借钱',SysIcons.BORROW_MONEY),
              getItemColumn('加盟合作',SysIcons.COPERATION),
              getItemColumn('更多',SysIcons.MORE),
            ],
          ),
        ],
      ),
    );
  }
}