import 'package:flutter/widgets.dart';

class Profile {
  String name;
  String avatar;
  String account;

  Profile({
    this.name,
    this.account,
    this.avatar
  });
}

 Profile me = new Profile(
  name: 'wkiwi',
  avatar:'https://avatars3.githubusercontent.com/u/35719531?s=460&v=4',
  account: 'WZ610935700'
);