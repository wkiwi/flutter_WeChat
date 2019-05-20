import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/chat_detail_page.dart';

Handler chatDetailHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    final index = params['index'].first;
    print('message>detail title is ${index}');
    final inde = int.parse(index);
    return ChatDetailPage(inde);
  }
);