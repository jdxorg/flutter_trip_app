/**
 * 我的
 */

import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/widget/home/menu.dart';


class MyPage extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyPage'),
      ),
    );
  }
  @override 
  bool get wantKeepAlive => true;
  
  @override 
  void initState(){
    super.initState();
    print('my_page initState...');
  }
}

