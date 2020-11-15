import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final Function onTap;
  final bool isLoading;

  CustomImageContainer({
    this.image,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil.instance.setHeight(300),
          width: ScreenUtil.instance.setWidth(360),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Styles.CUSTOM_SHADOW_COLOR,
                    blurRadius: 10,
                    offset: Offset(1, 1))
              ]),
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                )
              : image != null
                  ? Image.network(
                      image,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.add_a_photo,
                          size: 50, color: Styles.PRIMARY_COLOR)),
        ),
      ),
    );
  }
}
