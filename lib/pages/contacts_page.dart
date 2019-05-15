import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './contacts_page/contact_item.dart';
import '../model/contacts.dart';
import '../common/style/style.dart' show ICons,AppColors;

class ContactsPage extends StatefulWidget {
  Color _indexBarBg = Colors.transparent;
  String _currentLetter = '';
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

const INDEX_BAR_WORDS = [
  "↑", "☆",
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U",
  "V", "W", "X", "Y", "Z", "#"
];

class _ContactsPageState extends State<ContactsPage> {
  ScrollController _scrollController;
  final List<Contact> data = Contact.contacts;
  final List<Contact> _contacts  = [];
  final List<Contact> _functionButtons = [
    new Contact(
      avatar: 'assets/images/ic_new_friend.png',
      name: '新的朋友',
      onPressed: (){
        print('点击了新的朋友');
      },
    ),
    new Contact(
      avatar: 'assets/images/ic_group_chat.png',
      name: '群聊',
      onPressed: (){
        print('群聊');
      },
    ),
    new Contact(
      avatar: 'assets/images/ic_tag.png',
      name: '标签',
      onPressed: (){
        print('标签');
      },
    ),
    new Contact(
      avatar: 'assets/images/ic_public_account.png',
      name: '公众号',
      onPressed: (){
        print('公众号');
      },
    ), 
  ];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};
  @override
  void initState(){
    super.initState();
    _contacts..addAll(data)..addAll(data)..addAll(data);
    _contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    _scrollController = new ScrollController();
    //计算indexBar定位关键词列表项的位置
    //四个功能选项的高度
    var _totalPos = _functionButtons.length * ScreenUtil().setHeight(99.5);
    print(_totalPos);
    for(int i = 0; i < _contacts.length; i++){
      bool _hasGroupTitle = true;
      if(i > 0 && _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0){
        _hasGroupTitle = false;
      }
      if(_hasGroupTitle){
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
        _totalPos += ScreenUtil().setHeight(50);
      }
      _totalPos += ScreenUtil().setHeight(100);
    }
    print(_letterPosMap);
  }
  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String _getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPos);
    int index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if(_letterPosMap.isNotEmpty) {
      final _pos = _letterPosMap[letter];
      if(_pos != null) {
        _scrollController.animateTo(_pos, 
            curve: Curves.easeOut, duration: Duration(milliseconds: 200));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _body = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context,index){
          if(index < _functionButtons.length){
            return ContactItem(_functionButtons[index],false);
          }
          bool _isGroupTitle = true;
          int _contactIndex = index - _functionButtons.length;
          if(_contactIndex >=1 && _contacts[_contactIndex].nameIndex == _contacts[_contactIndex - 1].nameIndex){
            _isGroupTitle = false;
          }
          return ContactItem(_contacts[_contactIndex],_isGroupTitle);
        },
        itemCount: _contacts.length + _functionButtons.length,
      ),
      Positioned(
        right: 0.0,
        top: 0.0,
        bottom:0.0,
        child: _indexBar(),
      ),     
    ];
    if(widget._currentLetter != null && widget._currentLetter.isNotEmpty){
      _body.add(
        Center(
          child: Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setWidth(200),
            decoration: BoxDecoration(
              color: AppColors.IndexLetterBoxBg,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Text(widget._currentLetter,style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(120)),),
            )
          ),
        )
      );
    }
    return  Stack(
      children: _body
    );
  }
  _indexBar(){
    return Container(
      color: widget._indexBarBg,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(100),bottom: ScreenUtil().setHeight(100)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(30),bottom: ScreenUtil().setHeight(30)),
      width: ScreenUtil().setWidth(50.0),
      child: LayoutBuilder(
        builder: _buildIndexBar,
      )
    );
  }
  Widget _buildIndexBar(BuildContext context,BoxConstraints constraints){
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word){
      return Expanded(
        child: Text(word),
      );
    }).toList();
    final double _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letters.length;
    print(_totalHeight);
    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details){//手指点下去会触发
        print('DragDownDetails');
        setState(() {
          widget._indexBarBg = Colors.black26;
          widget._currentLetter = _getLetter(context,_tileHeight,details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      onVerticalDragEnd: (DragEndDetails details){//手指滑动后松开会触发
        print('DragEndDetails');
        setState(() {
          widget._indexBarBg = Colors.transparent;
          widget._currentLetter = null;
        });
        
        //  _scrollController.animateTo(_scrollController.position.maxScrollExtent,curve: Curves.easeIn,duration: Duration(milliseconds: 10));
        // _scrollController.jumpTo(_scrollController.position.maxScrollExtent,);
      },
      onVerticalDragCancel: (){//手指未滑动，点击后松开
        print('onVerticalDragCancel');
        setState(() {
          widget._indexBarBg = Colors.transparent;
          widget._currentLetter = null;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details){
        setState(() {
          widget._indexBarBg = Colors.black26;
          widget._currentLetter = _getLetter(context,_tileHeight,details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      child: Column(
        children: _letters
      ),
    );
  }
}
