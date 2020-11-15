import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/custom/custom_feed_card.dart';
import 'package:dasavatar_app/store/post_store.dart';
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
        backgroundColor: Styles.WHITE_COLOR,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(20),
          ),
          color: Styles.WHITE_COLOR,
          child: StoreObserver<PostStore>(
              builder: (PostStore postStore, BuildContext context) {
            if (postStore.posts == null) postStore.getAllPost();
            if (postStore.isLoading)
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                ),
              );
            if (postStore.posts == null || postStore.posts.isEmpty)
              return Center(
                child: Text("No Post Yet"),
              );
            return ListView.builder(
                itemCount: postStore.posts.length,
                itemBuilder: (context, index) {
                  return CustomFeedCard(
                    post: postStore.posts.values.toList()[index],
                  );
                });
          }),
        ),
      ),
    );
  }
}
