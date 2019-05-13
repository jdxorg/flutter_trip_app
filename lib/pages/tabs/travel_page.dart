/**
 * 行程
 */

import 'package:flutter/material.dart';

class MyTravelPage extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyTravelPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyTravelPage'),
      ),
    );
  }

  @override 
  bool get wantKeepAlive => true; 
}