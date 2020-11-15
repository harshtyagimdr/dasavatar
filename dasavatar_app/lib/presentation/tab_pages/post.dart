import 'package:dasavatar_app/presentation/custom/custom_image_box.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String _value;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageContainer(),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  


                  Card(
                    elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                      decoration: new BoxDecoration(
                    color: Colors.white,
            borderRadius: BorderRadius.circular(10),
                      ),
                        child:
                         DropdownButton(                
                         value: _value,
                            items: [
                              DropdownMenuItem(
                                
                                child: Text("Any Crime Scene"),
                                value: "Any Crime Scene",
                              ),
                              DropdownMenuItem(
                                child: Text("Group gathering"),
                                value: "Group Gathering",
                              ),
                              DropdownMenuItem(
                                  child: Text("Animal Injured"), value: "Animal Injured"),
                              DropdownMenuItem(
                                  child: Text("Car Accident"), value: "Car Accident")
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            })),
                                      ),
                  )
                          // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
