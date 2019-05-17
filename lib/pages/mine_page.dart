import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './component/full_with_icon_button.dart';
import '../common/style/style.dart' show ICons,AppColors;
import '../model/me.dart';
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){},
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40.0),right: ScreenUtil().setWidth(20.0),bottom: ScreenUtil().setWidth(50.0),top: ScreenUtil().setWidth(10.0)),
      color: AppColors.HeaderCardBg,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(me.avatar,width:ScreenUtil().setWidth(120.0),height:ScreenUtil().setWidth(120.0)),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(30.0)),
                  alignment: Alignment.centerLeft,
                  child:  Text(me.name,style: TextStyle(color: Color(AppColors.HeaderCardTitleText),fontSize: ScreenUtil().setSp(40.0)),),
                ),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(30.0)),
                  alignment: Alignment.centerLeft,
                  child:  Text(me.account,style:TextStyle(color: Color(AppColors.HeaderCardDesText),fontSize: ScreenUtil().setSp(30.0)),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _Header(),
            SizedBox(
              height: ScreenUtil().setHeight(20.0),
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_wallet.png',
              title: '支付',
              showDivider: false,
              onPressed: (){},
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20.0),
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showDivider: true,
              onPressed: (){},
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showDivider: true,
              onPressed: (){},
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: '卡包',
              showDivider: true,
              onPressed: (){},
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              showDivider: false,
              onPressed: (){},
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20.0),
            ),
            FullWithIconButton(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              showDivider: false,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}