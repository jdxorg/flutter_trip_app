
import 'package:flutter/material.dart';

class MyPhotoPage extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyPhotoPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyPhotoPage'),
      ),
    );
  }

  @override 
  bool get wantKeepAlive => true;
}