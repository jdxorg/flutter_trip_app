/**
 * 我的
 */

import 'package:flutter/material.dart';


class MyPage extends StatelessWidget{
  static final String sName='my';
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyPage'),
      ),
    );
  }
}
