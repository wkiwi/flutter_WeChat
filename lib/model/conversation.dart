import '../common/style/style.dart';

class Conversation {
  String avatar;
  String title;
  int titleColor;
  String des;
  String updateAt;
  bool isMute;
  int unreadMsgCount;
  bool displayDot;
  int groupId;
  int userId;
  int type;
  
  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }

  Conversation({
    this.avatar,
    this.title,
    this.titleColor : AppColors.TitleColor,
    this.des,
    this.updateAt,
    this.isMute : false,
    this.unreadMsgCount : 0,
    this.displayDot : false,
    this.groupId,
    this.userId,
    this.type
  }) :  assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);
        
static  List<Conversation> mockConversations  = [
    new Conversation(
      avatar: 'assets/images/ic_group_chat.png',
      title: 'flutter交流群',
      des: '点击进入聊天',
      updateAt: '19:56',
      unreadMsgCount: 2,
      displayDot: true,
      groupId: 111111,
      userId:000000,
      type: 2
    ),
    new Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      des: '',
      updateAt: '19:56',
      unreadMsgCount: 0,
      displayDot: true,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      des: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '25元现金助力开学季！',
      updateAt: '17:12',
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    ),
    new Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
      groupId: 000000,
      userId:000000,
      type: 1
    )
];
}