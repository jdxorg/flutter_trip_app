/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import './RouteHandler.dart';
import './RouteConfig.dart';

class Routes {
  static void configureRoutes(Router router) {
    routes.forEach((model){
      router.define(model.name, handler: HandlerFactory.createHandler(model.name));
    });
  }
}
