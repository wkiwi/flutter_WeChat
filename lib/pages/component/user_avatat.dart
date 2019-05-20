import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/style/style.dart' show ICons,AppColors;

class UserAvatar extends StatelessWidget {
  final bool isNetwork;
  final String image;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  UserAvatar(
      {this.isNetwork, this.image, this.onPressed, this.width = 30.0, this.height = 30.0, this.padding});

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: padding ??  EdgeInsets.only(top: 4.0, right: 5.0, left: 5.0),
      constraints:  BoxConstraints(minWidth: 0.0, minHeight: 0.0),
      child: ClipRRect(
        borderRadius:  BorderRadius.all(Radius.circular(5.0)),
        child: this.isNetwork ?  
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/ic_public_account.png',
            //预览图
            fit: BoxFit.fitWidth,
            image: image,
            width: width,
            height: height,
          ) 
          :Image.asset(
            image,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
      ),
      onPressed: onPressed
    );
  }
}