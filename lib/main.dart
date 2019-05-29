import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/currentIndex.dart';
import './provide/websocket.dart';
import './common/style/style.dart' show AppColors;
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';
void main() { 
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  var websocketProvide = WebSocketProvide();
  providers
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
  ..provide(Provider<WebSocketProvide>.value(websocketProvide));
  runApp(ProviderNode(child:MyApp(),providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;
    Provide.value<WebSocketProvide>(context).init();
    return Container(
      child:MaterialApp(
        title: '微信',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.PrimaryColor),
          cardColor: Color(AppColors.CardBgColor),
          backgroundColor: Color(AppColors.BackgroundColor),
        ),  
        home: IndexPage(),
      )
    );
  }
}

