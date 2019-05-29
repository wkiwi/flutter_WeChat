import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/chat_detail_page.dart';

Handler chatDetailHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    final index = params['index'].first;
    final typ = params['type'].first;
    print('message>detail title is ${index}');
    final inde = int.parse(index);
    final type = int.parse(typ);
    return ChatDetailPage(inde,type);
  }
);