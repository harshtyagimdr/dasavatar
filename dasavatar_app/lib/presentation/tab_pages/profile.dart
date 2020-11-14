import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
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
