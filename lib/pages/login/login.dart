import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  final Map<String,dynamic> params;
  LoginPage(this.params);
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LoginPage'),
      ),
      body: Text(params.toString()),
   );
  }
}