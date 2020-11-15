import 'package:dasavatar_app/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFeedCard extends StatelessWidget {
    final Post post;

    CustomFeedCard({
      this.post
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(20)),
      child: Card(
        elevation: 10,

        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
          padding:EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(20),
            vertical: ScreenUtil.instance.setHeight(20),
          ),
          child: Column(
            children: [
              Row(
               children: [
                 CircleAvatar(
                   child: Text("HT"),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
                     child: Text("Harsh Tyagi"))
               ],
                ),
              Container(

                margin: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(10)),
                child: Image.network('https://picsum.photos/300?image=9'),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text("Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                ),
              Container(
                margin: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(10)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                  ,
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
