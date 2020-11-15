import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  final String url;
  final bool profile;
  CustomLogo({
    this.url,
    this.profile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: ScreenUtil.instance.setHeight(160),
          height: ScreenUtil.instance.setHeight(160),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image:(profile == true)? DecorationImage(image: AssetImage(url), fit: BoxFit.fill): DecorationImage(image: NetworkImage(url), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
