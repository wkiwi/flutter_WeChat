import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketProvide with ChangeNotifier{
  var channel;
  createWebsocket(){
    channel = new IOWebSocketChannel.connect('ws://localhost:8001');
  }

  sendMessage(){//发送消息
    channel.sink.add('Hello!');
    notifyListeners();
  }
  monitorMessage(){//监听消息
    new StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        if(snapshot.hasData ){
          notifyListeners();
          print(snapshot.data);
          return snapshot.data;
        }
      },
    );
  }
  closeWebSocket(){//关闭链接
    channel.sink.close();
    notifyListeners();
  }
}
