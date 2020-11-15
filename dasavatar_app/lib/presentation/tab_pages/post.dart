import 'package:dasavatar_app/presentation/custom/custom_button.dart';
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
        
                 SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),

                  CustomImageContainer(),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                   SizedBox(
          height: ScreenUtil.instance.setHeight(16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  Card(
                    elevation: 3,
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
                                  child: Text("Others"), value: "Others")
                  

                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            })),
                                      ),
                  )
          ],
        ),
          SizedBox(
                    height: ScreenUtil.instance.setHeight(16),
                  ),

         Text('Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),

  SizedBox(
                    height: ScreenUtil.instance.setHeight(16),
                  ),
      
           TextField(
               minLines: 3,
             keyboardType: TextInputType.multiline,
              maxLines: null,
            decoration:  InputDecoration(
              enabledBorder:  OutlineInputBorder(
                  
                   borderRadius: BorderRadius.circular(5.0),
                    borderSide:  BorderSide(color: Styles.PRIMARY_COLOR , width: 2)),
  
                focusedBorder:  OutlineInputBorder(
                  
                   borderRadius: BorderRadius.circular(5.0),
                    borderSide:  BorderSide(color: Styles.PRIMARY_COLOR , width: 2)),
                hintText: 'Description',
               ),
          ),

            SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),

          CustomButton(
            text: 'Post',
          )
        
            


                
                        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
