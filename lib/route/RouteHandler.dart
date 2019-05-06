/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
class HandlerFactory {
  static Handler createHandler(String routeName) {
    return new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        switch(routeName){
          case '/':print("Root !!!");break;
          default:
            print("ROUTE WAS NOT FOUND !!!");
          break;
        }
      },
    );
  }
}
