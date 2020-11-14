import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String initialValue;
  final double width;
  final TextInputType textInputType;
  final Function onSaved;
  final Function onChanged;
  final Function validator;
  final IconData icon;
  final bool isPrefixIcon;

  CustomTextField({
    this.labelText,
    this.hintText,
    this.initialValue,
    this.width,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.textInputType = TextInputType.text,
    this.icon = Icons.location_on,
    this.isPrefixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.instance.setWidth(width ?? ScreenUtil.instance.width),
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.instance.setHeight(10)),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(8),
      ),
      decoration: BoxDecoration(color: Styles.WHITE_COLOR, boxShadow: [
        BoxShadow(
            color: Styles.CUSTOM_SHADOW_COLOR.withOpacity(.1),
            blurRadius: 3,
            offset: Offset(0, 5))
      ]),
      child: Padding(
        padding: (isPrefixIcon) ? EdgeInsets.all(0) : EdgeInsets.only(left: 16),
        child: TextFormField(
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator ?? requiredString,
            keyboardType: textInputType,
            initialValue: initialValue,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                labelText: labelText,
                prefixIcon: isPrefixIcon
                    ? Icon(
                        icon,
                        color: Colors.yellow,
                      )
                    : null,
                hintStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
      ),
    );
  }
}
