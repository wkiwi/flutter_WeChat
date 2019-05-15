import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/contacts.dart';
import '../../common/style/style.dart';
class ContactItem extends StatelessWidget {
  ContactItem(this.contactItemData,this.isGroupTitle)
  :assert(contactItemData != null);

  bool isGroupTitle;
  final Contact contactItemData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GroupTitle(),
        InkWell(
          child: Row(
            children: <Widget>[
              Avatar(),
              Title()
            ],
          ),
          onTap: (){
            contactItemData.onPressed();
          },
        )
      ],
    );
  }

  Widget GroupTitle(){
    if(isGroupTitle){
      return Container(
        child: Text(contactItemData.nameIndex,style: TextStyle(color: Color(AppColors.ContactGroupTitleText)),),
        height: ScreenUtil().setHeight(50.0),
        width: ScreenUtil().setWidth(750.0),
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(25.0)),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(AppColors.ContactGroupTitleBg),
          border: BorderDirectional(
            top: BorderSide(width: ScreenUtil().setHeight(0.5),color:Color(AppColors.DividerColor)),
            bottom: BorderSide(width: ScreenUtil().setHeight(0.5),color:Color(AppColors.DividerColor))
          )
        ),
      );
    }else{
      return Container();
    }
  }
  Widget Avatar(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(25.0),right: ScreenUtil().setWidth(25.0),top:ScreenUtil().setWidth(17.0),bottom:ScreenUtil().setWidth(17.0)),
      width: ScreenUtil().setWidth(80.0),
      height: ScreenUtil().setHeight(66.0),
      child: contactItemData.isAvatarFromNet() ?  Image.network(contactItemData.avatar,scale: 1.0,) : Image.asset(contactItemData.avatar),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.black12,
      ),
    );
  }
  Widget Title(){
    return Expanded(
      child: Container(
        height: ScreenUtil().setHeight(100.0),
        child: Text(contactItemData.name,style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Colors.black,fontWeight: FontWeight.w400),),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: ScreenUtil().setHeight(0.5),color: Color(AppColors.DividerColor))
          )
        )
      ),
    );
  }
}