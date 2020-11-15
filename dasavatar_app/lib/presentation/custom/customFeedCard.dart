import 'package:dasavatar_app/model/post.dart';
import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/location.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFeedCard extends StatelessWidget {
  final Post post;

  CustomFeedCard({this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (post.latitude != null && post.longitude != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              Location(lat: double.parse(post.latitude),long: double.parse(post.longitude),)));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(20)),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil.instance.setWidth(20),
              vertical: ScreenUtil.instance.setHeight(20),
            ),
            child: Column(
              children: [
                post.identity != null && post.identity && post.user_id != null
                    ? StoreObserver<UserStore>(
                  builder: (UserStore userStore, BuildContext context) {
                    userStore.getUserById(uid: post.user_id);
                    return Row(
                      children: [
                        Container(
                          height: ScreenUtil.instance.setWidth(40),
                          width: ScreenUtil.instance.setWidth(40),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: userStore.userList
                              .containsKey(post.user_id)
                              ? userStore.userList[post.user_id].imgUrl ==
                              null
                              ? Text(userStore
                              .userList[post.user_id].name
                              .substring(0, 1))
                              : Container(
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(
                                    ScreenUtil.instance
                                        .setWidth(40)),
                                child:
                                Image.network(post.imageUrl)),
                          )
                              : SizedBox(),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(10)),
                            child: userStore.userList
                                .containsKey(post.user_id)
                                ? Text(
                                userStore.userList[post.user_id].name)
                                : Text(""))
                      ],
                    );
                  },
                )
                    : SizedBox(),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil.instance.setHeight(10)),
                  child: Image.network(post.imageUrl),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    post.category,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil.instance.setHeight(10)),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        post.description,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
