import 'package:dasavatar_app/presentation/home_page.dart';
import 'package:dasavatar_app/presentation/user_access_page.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = 'SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double defaultHeight = 896;
  double defaultWidth = 414;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        height: defaultHeight, width: defaultWidth, allowFontScaling: false)
      ..init(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      ),
    );
  }

  checkUser() async {
    String uid = await preferenceService.getUID();
    print("UID");
    print(uid);
    if (uid != null) {
      await Provider.of<UserStore>(context).getUser();
      Navigator.pushReplacementNamed(context, HomePage.routeNamed);
    } else {
      Navigator.pushReplacementNamed(context, UserAccessPage.routeNamed);
    }
  }
}
