/**
 * 我的
 */

import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/menu.dart';

class MyPage extends StatelessWidget{
  static final String sName='my';
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyPage'),
      ),
      body: new HomeMenu(),
    );
  }
}


