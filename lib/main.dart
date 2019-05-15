import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/currentIndex.dart';
import './common/style/style.dart' show AppColors;
void main() { 
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  providers
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child:MyApp(),providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child:MaterialApp(
        title: '微信',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.PrimaryColor),
          cardColor: Color(AppColors.APPCardColor),
          backgroundColor: Color(AppColors.BackgroundColor),
        ),
        home: IndexPage(),
      )
    );
  }
}

