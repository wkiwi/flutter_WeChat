import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routers{
  static String root = '/';
  static String chatdetailPage = 'chatdetail';
  static void configureRouters(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error====>route was not found!!!!!');
      }
    );

    router.define(chatdetailPage,handler: chatDetailHandler);
  }
}