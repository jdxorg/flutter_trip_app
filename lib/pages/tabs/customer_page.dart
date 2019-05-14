/**
 * 客服
 */
import 'package:flutter/material.dart';

class MyCustomer extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyCustomer> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyCustomer'),
      ),
    );
  }
  @override 
  bool get wantKeepAlive => true;

  @override 
  void initState(){
    super.initState();
  }
}