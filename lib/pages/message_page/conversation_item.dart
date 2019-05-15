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
        border: Border(
          bottom: BorderSide(width: 0.5,color: Color(AppColors.DividerColor),)
        )
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer(conversationItemData),
          Title(conversationItemData),
          Tip(conversationItemData)
        ],
      ),
      
    );
  }

  Widget Avatar(conversationItemData){
    return Container(
      child: conversationItemData.isAvatarFromNet() ? Image.network(conversationItemData.avatar,scale: 1.0,): Image.asset(conversationItemData.avatar),
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(100)
    );
  } 

  Widget Title(conversationItemData){
    return Expanded(
      child: ListTile(
        title: Text(conversationItemData.title,style: TextStyle(fontSize: ScreenUtil().setSp(28.0),color: Color(AppColors.TitleColor))),
        subtitle: Text(conversationItemData.des,style: TextStyle(fontSize: ScreenUtil().setSp(24.0),color: Color(AppColors.DesTextColor)))
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
      width:ScreenUtil().setWidth(100),
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
      child: Text(conversationItemData.unreadMsgCount.toString(),style:TextStyle(fontSize: ScreenUtil().setSp(14),color: Color(AppColors.NotifyDotText))),
    );
  }

  Widget muteIcon(){
    return new Icon(ICons.MUTE_ICON);
  }
}