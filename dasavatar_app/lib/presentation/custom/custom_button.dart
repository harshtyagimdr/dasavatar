import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Function onTap;
  final double width;
  final Color buttonColor;
  final Color textColor;
  final Widget child;
  final double verticalMargin;
  final double fontSize;

  CustomButton({
    this.text,
    this.onTap,
    this.width,
    this.fontSize = 16,
    this.buttonColor = Styles.PRIMARY_COLOR,
    this.textColor = Styles.WHITE_COLOR,
    this.isLoading = false,
    this.child,
    this.verticalMargin = 10,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isLoading) return;
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(verticalMargin)),
        constraints:
            BoxConstraints(minHeight: ScreenUtil.instance.setHeight(60)),
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(10)),
        width: ScreenUtil.instance.setWidth(width ?? ScreenUtil.instance.width),
        color: buttonColor,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                )
              : child ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          text,
                          style:
                              TextStyle(color: textColor, fontSize: fontSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
