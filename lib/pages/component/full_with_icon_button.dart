import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/style/style.dart' show ICons,AppColors;
class FullWithIconButton extends StatelessWidget {
  const FullWithIconButton({
    this.title,
    this.iconPath,
    this.onPressed,
    this.showDivider,
    this.description
  }): assert (title != null),
      assert (iconPath != null),
      assert (onPressed != null);

  final bool showDivider;
  final String iconPath;
  final String title;
  final VoidCallback onPressed;
  final String description;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(right: 0.0,left: ScreenUtil().setWidth(30.0)),
      onPressed: (){onPressed();},
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconPath,
            width: ScreenUtil().setWidth(50.0),
            height: ScreenUtil().setWidth(50.0),
          ),
          SizedBox(width: ScreenUtil().setWidth(35.0),),
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(80.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5,color: showDivider ? Colors.black12 : Colors.white)
                )
              ),
              child: Row(
                children: <Widget>[
                    Expanded(
                      child:Text(title,style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Color(AppColors.FullWithIconButton)),),
                    ),
                    Icon(ICons.RIGHT,color: Color(AppColors.KeyboardArrowRight),),
                    SizedBox(width: ScreenUtil().setWidth(25.0),)
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}