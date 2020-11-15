import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTextCard extends StatelessWidget {
  final IconData preIcon;
  final double preIconSize;
  final bool visiblepreIcon;
  final IconData postIcon;
  final bool visiblepostIcon;
  final String labelText;
  final FontWeight labelTextWeight;
  final double sizelabelText;
  final String hintText;
  final double sizehintText;
  final Function onTap;
  final bool margin;
  final double postIconSize;

  CustomProfileTextCard({
    this.preIcon,
    this.postIcon,
    this.labelText,
    this.hintText = "",
    this.visiblepreIcon = false,
    this.visiblepostIcon = false,
    this.sizehintText = 16,
    this.sizelabelText = 22,
    this.labelTextWeight = FontWeight.w500,
    this.onTap,
    this.margin = false,
    this.preIconSize = 24,
    this.postIconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: (margin)
            ? EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(0))
            : EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: (visiblepreIcon)
                      ? Icon(
                          preIcon,
                          size: preIconSize,
                          color: Styles.BLUE_GREY_COLOR,
                        )
                      : Container(),
                ),
                Container(
                    child: (visiblepreIcon)
                        ? SizedBox(width: ScreenUtil.instance.setWidth(8))
                        : Container()),
                Container(
                    child: (hintText == "")
                        ? Text(
                            labelText,
                            style: TextStyle(
                                fontSize: sizelabelText,
                                fontFamily: 'Montserrat',
                                fontWeight: labelTextWeight),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(labelText,
                                  style: TextStyle(
                                      fontSize: sizelabelText,
                                      fontWeight: labelTextWeight)),
                              Text(hintText,
                                  style: TextStyle(
                                    
                                      fontSize: sizehintText,
                                      fontWeight: FontWeight.w500))
                            ],
                          )),
              ],
            ),
            Container(
                child: (visiblepostIcon)
                    ? InkWell(
                        onTap: onTap,
                        child: Icon(
                          postIcon,
                          size: postIconSize,
                          color: Styles.BLUE_GREY_COLOR,
                        ),
                      )
                    : Container())
          ],
        ) 
        );
  }
}
