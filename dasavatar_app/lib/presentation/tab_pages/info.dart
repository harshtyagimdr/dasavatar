import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/custom_image_box.dart';
import 'package:dasavatar_app/presentation/custom/customlogo.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                 SizedBox(
                height: ScreenUtil.instance.setHeight(32),
              ),

                  Center(
                          child: CustomLogo(
                            url: 'assets/logo.jpeg',
                            profile: true,
                          )),
                

        
            


                
                        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
