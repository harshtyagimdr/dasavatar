import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
              color: Styles.PRIMARY_COLOR,
    ),
        ),);
  }
}
