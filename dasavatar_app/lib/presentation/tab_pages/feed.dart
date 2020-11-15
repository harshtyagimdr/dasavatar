import 'package:dasavatar_app/presentation/custom/customFeedCard.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

                  body: Container(
                      margin:EdgeInsets.symmetric(
                        horizontal: ScreenUtil.instance.setWidth(20),
                      ),
                  color: Styles.WHITE_COLOR,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,index){
                      return CustomFeedCard();
                    })
    ),
        ),);
  }
}
