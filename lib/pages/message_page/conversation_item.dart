import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/style/style.dart';
import '../../model/conversation.dart';
class ConversationItem extends StatelessWidget {

  ConversationItem(this.conversationItemData)
  :assert(conversationItemData != null);

  final Conversation conversationItemData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer(conversationItemData),
          Content(),
        ],
      ),
      
    );
  }
  Widget Content(){
    return Expanded(
      child: Container(
        height: ScreenUtil().setWidth(130),
        margin: EdgeInsets.only(left:ScreenUtil().setWidth(20.0)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5,color: Color(AppColors.DividerColor),)
          )
        ),
        child: Row(
          children: <Widget>[
            Title(conversationItemData),
            Tip(conversationItemData)
          ],
        ),
      ),
    );
  }
  Widget ClipRRectImg(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: conversationItemData.isAvatarFromNet() ?  Image.network(conversationItemData.avatar,scale: 1.0, fit: BoxFit.cover,) : Image.asset(conversationItemData.avatar, fit: BoxFit.cover,),
    );
  } 

  Widget Avatar(conversationItemData){
    return Container(
      margin: EdgeInsets.only(left:ScreenUtil().setWidth(20.0)),
      child: ClipRRectImg(),
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setWidth(100)
    );
  } 

  Widget Title(conversationItemData){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            conversationItemData.title,
            style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Color(AppColors.TitleColor),fontWeight:FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            conversationItemData.des,
            style: TextStyle(fontSize: ScreenUtil().setSp(24.0),color: Color(AppColors.DesTextColor)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

 
  Widget Tip(conversationItemData){
    var _rightArea =<Widget>[
      Text(conversationItemData.updateAt,style:TextStyle(fontSize: ScreenUtil().setSp(24.0),color: Color(AppColors.DesTextColor))),
    ];
    if(conversationItemData.isMute){
      _rightArea.add(new Icon(ICons.MUTE_ICON,color: Color(AppColors.ConversationMuteIcon),size: ScreenUtil().setSp(30),));
    }else{
      _rightArea.add(new Icon(ICons.MUTE_ICON,color: Colors.transparent,size: ScreenUtil().setSp(30),));
    }
    return Container(
      width:ScreenUtil().setWidth(80),
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10.0)),
      child: Column(
        children: _rightArea
      ),
    );
  }

  Widget avatarContainer(conversationItemData){
    if(conversationItemData.unreadMsgCount > 0){
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Avatar(conversationItemData),
          Positioned(
            right:-6.0 ,
            top: -6.0,
            child: unreadMsgCountText(conversationItemData),
          )
        ],
      );
    }else{
      return Avatar(conversationItemData);
    }
  }
  Widget unreadMsgCountText(conversationItemData){
    return Container(
      width: ScreenUtil().setWidth(30.0),
      height: ScreenUtil().setWidth(30.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Color(AppColors.NotifyDotBg)
      ),
      child: Text(conversationItemData.unreadMsgCount.toString(),style:TextStyle(fontSize: ScreenUtil().setSp(18),color: Color(AppColors.NotifyDotText))),
    );
  }

  Widget muteIcon(){
    return new Icon(ICons.MUTE_ICON);
  }
}