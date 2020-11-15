import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final Function onTap;
CustomImageContainer({
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenUtil.instance.setHeight(300),
        width: ScreenUtil.instance.setWidth(360),
        child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Styles.CUSTOM_SHADOW_COLOR,
                        blurRadius: 10,
                        offset: Offset(1, 1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Container(child: Icon(Icons.add_a_photo,size: 50,color: Styles.PRIMARY_COLOR))
                ),
              ),
            )),

      ),
    );
  }
}
