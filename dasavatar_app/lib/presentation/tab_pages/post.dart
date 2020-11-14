import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Post extends StatefulWidget {
 
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
                  body: Container(
              color: Styles.WHITE_COLOR,
    ),
        ),);
  }
}
