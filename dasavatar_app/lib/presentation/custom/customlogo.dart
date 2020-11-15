import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  final String url;
  final bool isLoading;

  CustomLogo({
    this.url,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(115),
      height: ScreenUtil.instance.setWidth(115),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Styles.BLUE_GREY_COLOR,
              blurRadius: 10,
              offset: Offset(2, 4))
        ],
        color: Colors.white,
      ),
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
            )
          : url != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: url.contains('http')
                      ? Image.network(
                          url,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          url,
                          fit: BoxFit.contain,
                        ),
                )
              : Container(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.person,
                      size: 30, color: Styles.PRIMARY_COLOR)),
    );
  }
}
