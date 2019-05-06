/**
 * 客服
 */
import 'package:flutter/material.dart';


class MyCustomer extends StatelessWidget{
  static final String sName='customer';
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyCustomer'),
      ),
    );
  }
}