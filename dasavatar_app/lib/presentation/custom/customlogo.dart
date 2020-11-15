import 'package:dasavatar_app/presentation/splash_page.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  final String url;
  CustomLogo({
    this.url,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(130),
      width: ScreenUtil.instance.setWidth(120),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Styles.BLUE_GREY_COLOR,
                blurRadius: 10,
                offset: Offset(2, 4))
          ],
          color: Colors.white,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill)),
    );
  }
}
