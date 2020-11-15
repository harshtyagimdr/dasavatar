import 'package:dasavatar_app/presentation/custom/custom_image_box.dart';
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
        body: SingleChildScrollView(
                  child: Container(
            color: Styles.WHITE_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  CustomImageContainer()


                ],
                ),
            ),
            ),
        ),
        ),
      );
  }
}



