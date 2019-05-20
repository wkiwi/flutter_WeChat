import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/style/style.dart';
import './chat_detail/chat_content_view.dart';
import '../model/conversation.dart';
class ChatDetailPage extends StatefulWidget {
  int index;
  ChatDetailPage(this.index);
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState(Conversation.mockConversations[index]);
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  ScrollController _scrollController;
  bool hasText = false;
  Conversation data;
  _ChatDetailPageState(this.data);
  final messageList = [
    {'type':0,'text':'hello',},
    {'type':1,'text':'hello',},
    {'type':0,'text':'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',},
    {'type':1,'text':'它也是构建未来的Google Fuchsia [1]  应用的主要方式。',},
    {'type':0,'text':'Flutter是谷歌的移动UI框架 [4]  ，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。它也是构建未来的Google Fuchsia [1]  应用的主要方式。',},
    {'type':1,'text':'Flutter组件采用现代响应式框架构建，这是从React中获得的灵感，中心思想是用组件(widget)构建你的UI。 组件描述了在给定其当前配置和状态时他们显示的样子。当组件状态改变，组件会重构它的描述(description)，Flutter会对比之前的描述， 以确定底层渲染树从当前状态转换到下一个状态所需要的最小更改。',},
    {'type':0,'text':'Flutter的第一个版本被称为“Sky”，运行在Android操作系统上。它是在2015年Dart开发者峰会 [3]  上亮相的，其目的是能够以每秒120帧的速度持续渲染。',},
    {'type':1,'text':'runApp函数接收给定的组件(Widget)并使其成为组件树的根。 在此例中，组件树由两个组件构成，Center组件和它的子组件-Text组件。框架强制根组件覆盖整个屏幕，这意味着“Hello, world”文本在屏幕上居中显示。需要注意的是，在上面的Text实例中必须指定文本显示方向。不必担心，当使用MaterialApp时，它会帮你自动解决这些小事情，稍后将进行演示。',},
    {'type':0,'text':'在编写app时，通常会创建新组件，是继承无状态的StatelessWidget还是有状态的StatefulWidget， 取决于您的组件是否需要管理状态。组件的主要工作是实现一个build函数，它使用其他低级别的组件来构建自己。Flutter框架将依次构建这些组件，最终会到达代表底层渲染对象的组件-RenderObject，它会计算并描述组件的几何形状。',},
  ];
  
  final controller = TextEditingController();
  void _handleSubmitted(String text) {
      if (controller.text.length > 0) {
        print('发送${text}');
        setState(() {
          hasText = false;
          messageList.add({'type':1,'text':text,});
        });
        controller.clear(); //清空输入框
        _jumpBottom();
      }
  }
  void _jumpBottom(){//滚动到底部
    _scrollController.animateTo(99999,curve: Curves.easeOut, duration: Duration(milliseconds: 200));
  }
  @override
  void initState(){
    super.initState();
    _scrollController = new ScrollController();
    // _jumpBottom();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:false,
        title: Text(data.title,style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Color(AppColors.APPBarTextColor),),),
        iconTheme: IconThemeData(
          color: Color(AppColors.APPBarTextColor)
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Color(AppColors.PrimaryColor),
        actions: <Widget>[
          Container(
              child: IconButton(
                icon: Icon(ICons.MENUS,color: Color(AppColors.APPBarTextColor),),
                onPressed: (){
                  print('点击了聊天信息界面');
                },
              ),
            ),
        ]
      ),
      body: Container(
        color: Color(AppColors.ChatDetailBg),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                return ChatContentView(
                  type:messageList[index]['type'],text:messageList[index]['text'],avatar:messageList[index]['type'] == 0 ? data.avatar: '',isNetwork: messageList[index]['type'] == 0 ? data.isAvatarFromNet() : false,username:data.title,userType:data.type);
              },
              itemCount: messageList.length,
              )
            ),
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(2.0), bottom:ScreenUtil().setHeight(2.0),left: 0,right: 0),
              color: Color(0xFFF7F7F7),
              child: Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(60.0),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                    child:  IconButton(
                      icon: Icon(ICons.VOICE),
                      onPressed: () {
                        print('切换到语音');
                      } 
                    ), 
                  ),
                  Expanded(
                    child: Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(15.0), bottom: ScreenUtil().setHeight(15.0)),
                    height: ScreenUtil().setHeight(60.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration.collapsed(hintText: null),
                      maxLines: 1,
                      autocorrect: true,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.green,
                      onChanged: (text) {
                        setState(() {
                            hasText = text.length > 0 ?  true : false; 
                        });
                        print('change=================== $text');
                      },
                      onSubmitted:_handleSubmitted,
                      enabled: true, //是否禁用
                    ),
                  )),
                  Container(
                    width: ScreenUtil().setWidth(60.0),
                    child:  IconButton(
                      icon: Icon(ICons.FACES), //发送按钮图标
                      onPressed: () {
                        print('打开表情面板');
                      } 
                    ), 
                  ),
                  Container(
                    width: ScreenUtil().setWidth(60.0),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20.0)),
                    child:  IconButton(
                      //发送按钮或者+按钮
                      icon: hasText ? Icon(Icons.send) :Icon(ICons.ADD), //发送按钮图标
                      onPressed: () {
                        if(!hasText){
                          print('打开功能面板');
                        }else{
                          _handleSubmitted(controller.text);
                        }
                      } 
                    ), 
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

