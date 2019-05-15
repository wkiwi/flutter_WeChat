import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './component/full_with_icon_button.dart';
import '../common/style/style.dart' show ICons,AppColors;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FullWithIconButton(
            iconPath: 'assets/images/ic_social_circle.png',
            title: '朋友圈',
            showDivider: false,
            onPressed: (){},
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          FullWithIconButton(
            iconPath: 'assets/images/ic_quick_scan.png',
            title: '扫一扫',
            showDivider: true,
            onPressed: (){},
          ),FullWithIconButton(
            iconPath: 'assets/images/ic_shake_phone.png',
            title: '摇一摇',
            showDivider: false,
            onPressed: (){},
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          FullWithIconButton(
            iconPath: 'assets/images/ic_feeds.png',
            title: '看一看',
            showDivider: true,
            onPressed: (){},
          ),FullWithIconButton(
            iconPath: 'assets/images/ic_quick_search.png',
            title: '搜一搜',
            showDivider: false,
            onPressed: (){},
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          FullWithIconButton(
            iconPath: 'assets/images/ic_shopping.png',
            title: '购物',
            showDivider: true,
            onPressed: (){},
          ),FullWithIconButton(
            iconPath: 'assets/images/ic_game_entry.png',
            title: '游戏',
            showDivider: false,
            onPressed: (){},
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20.0),
          ),
          FullWithIconButton(
            iconPath: 'assets/images/ic_mini_program.png',
            title: '小程序',
            showDivider: false,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}