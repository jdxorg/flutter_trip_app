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
import 'package:flutter_trip_app/utils/log/log.dart';

import 'package:flutter_trip_app/pages/login/login.dart';
class HandlerFactory {
  static Handler createHandler(String routeName) {
    return new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        switch(routeName){
          case '/':LogUtils.i("Root !!!");break;
          case '/login':return new LoginPage(params);break;
          default:
            LogUtils.i("ROUTE WAS NOT FOUND !!!");
          break;
        }
      },
    );
  }
}
