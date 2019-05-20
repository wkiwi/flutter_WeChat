import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/style/style.dart' show AppColors,Constants,ICons,MessageDetailSelects;
import '../component/user_avatat.dart';

class ChatContentView extends StatelessWidget {
  int type; //0 代表对方 ， 1代表自己
  String text;//聊天内容
  String avatar;//头像url
  String username;//昵称
  int userType;//聊天类型 2群组  1单聊
  bool isNetwork;
  ChatContentView({Key key, this.type, this.text,this.avatar,this.isNetwork,this.username,this.userType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tapPos;
    //头像组件
    Widget userAvatar =  UserAvatar(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(5),
        right: (type == 0 ? 0.0 : ScreenUtil().setWidth(15)),
        left: (type == 0 ? ScreenUtil().setWidth(15) : 0.0)
      ),
      width: ScreenUtil().setWidth(80),
      height: ScreenUtil().setWidth(80),
      image: avatar!='' ? avatar: 'assets/images/ic_public_account.png',
      isNetwork: isNetwork,
      onPressed: () {print('点击头像');}
    );
    
    Widget userNameWidget =   Container(
        margin: EdgeInsets.only(left: type == 0 ? ScreenUtil().setWidth(20) : 0,bottom: ScreenUtil().setHeight(10),right: type == 0 ? 0: ScreenUtil().setWidth(20)),
        child: Text(username,style: TextStyle(color: Color(AppColors.ChatTime),fontSize: ScreenUtil().setSp(23.0)),),
      );
    _showMenu(BuildContext context,Offset tapPos){
      final RenderBox overlay =Overlay.of(context).context.findRenderObject();
      final RelativeRect position = RelativeRect.fromLTRB(
        tapPos.dx, tapPos.dy,
        overlay.size.width - tapPos.dx,
        overlay.size.height - tapPos.dy
      );
      showMenu<String>(
        context: context,
        position: position,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_COPY_VALUE),
            value: MessageDetailSelects.MENU_COPY,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_SHARE_FRIENDS_VALUE),
            value: MessageDetailSelects.MENU_SHARE_FRIENDS,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_FAVORIITE_VALUE),
            value: MessageDetailSelects.MENU_FAVORIITE,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_REMIND_VALUE),
            value: MessageDetailSelects.MENU_REMIND,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_TRANSLATE_VALUE),
            value: MessageDetailSelects.MENU_TRANSLATE,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_DELATE_VALUE),
            value: MessageDetailSelects.MENU_DELATE,
          ),
          PopupMenuItem(
            child: Text(MessageDetailSelects.MENU_MULTIPE_CHOICE_VALUE),
            value: MessageDetailSelects.MENU_MULTIPE_CHOICE,
          ),
        ]
      ).then<String>((String selected) {
        switch(selected){
          default:
            print('当前选中的是：$selected');
        }
      });
    }
    Widget messageTextWidget = InkWell(
      onTapDown: (TapDownDetails details) {
        tapPos = details.globalPosition;
      },
      onLongPress: (){
        _showMenu(context,tapPos);
        print('弹出会话菜单');
      },
      child: Container(
        margin: type == 0 ? EdgeInsets.only(left:ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(115)) :EdgeInsets.only(left:ScreenUtil().setWidth(115),right: ScreenUtil().setWidth(20)),
        child: Text(text,
          style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Color(AppColors.TextBobule),height: 1.3),
        ),
        padding: EdgeInsets.only(left:ScreenUtil().setWidth(15),right:ScreenUtil().setWidth(15),bottom:ScreenUtil().setHeight(15),top:ScreenUtil().setHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: type == 0 ? Color(AppColors.TextBobuleLeft) : Color(AppColors.TextBobuleRight),
        ),
      ),
    );
    
    final List<Widget>  nameAndText = [
        userNameWidget,
        messageTextWidget
    ];
    final List<Widget>  onlyText = [
        messageTextWidget
    ];
    textBubble(){
      return Expanded(
        child: Column(
          crossAxisAlignment: type == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: userType == 2 && type == 0 ? nameAndText : onlyText,
        )
      );
    }
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10.0),top: ScreenUtil().setHeight(10.0)),
      child: type == 0 ?
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userAvatar,
          textBubble()
        ],
      ) :
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textBubble(),
          userAvatar,
        ],
      ) ,
    );
    
  }
}