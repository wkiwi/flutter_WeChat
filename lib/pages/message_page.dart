import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/style/style.dart' show ICons,AppColors;
import './message_page/conversation_item.dart';
import '../model/conversation.dart';
import '../provide/websocket.dart';

enum Device{
  MAC, WIN
}

class _DeviceinfoItem extends StatelessWidget {
  _DeviceinfoItem({this.device:Device.MAC});
  final Device device;

  String get devicename {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // color: Color(AppColors.DeviceInfoItemBg),
      decoration: BoxDecoration(
        color: Color(AppColors.DeviceInfoItemBg),
        border: Border(
          bottom:BorderSide(width: 0.5,color: Color(AppColors.DividerColor))
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: ScreenUtil().setWidth(30),),
          device == Device.WIN ? new Icon(ICons.WINDOWS,size: ScreenUtil().setSp(40.0),):new Icon(ICons.MAC,size: ScreenUtil().setSp(40.0),),
          SizedBox(width: ScreenUtil().setWidth(50),),
          Text('$devicename 微信已登陆,手机通知已关闭',style: TextStyle(fontSize: ScreenUtil().setSp(24.0),color: Color(AppColors.DeviceInfoItemText),))
        ],
      ),
    );
  }
}

class MessagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<WebSocketProvide>(
      builder: (context,child,val){
        var messageList = Provide.value<WebSocketProvide>(context).messageList;
        var length = Conversation.mockConversations.length + 1 + messageList.length;
        print(length);
        return Container(
          child: ListView.builder(
            itemBuilder:  (BuildContext context, int index){
              if(index == 0){
                return _DeviceinfoItem();
              } else if (index < Conversation.mockConversations.length + 1){
                return ConversationItem(Conversation.mockConversations[index - 1],index-1,0);
              }else {
                var inde = index - 1 - Conversation.mockConversations.length;
                return ConversationItem(messageList[inde],inde,1);
              }
            },
            itemCount: length ,
          )
        );
      }
    );
  }
}