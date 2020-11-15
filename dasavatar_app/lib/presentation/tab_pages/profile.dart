import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/splash_page.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Styles.WHITE_COLOR,
          child: Center(
            child: StoreObserver<UserStore>(
              builder: (UserStore userStore, BuildContext context) {
                return Container(
                  height: ScreenUtil.instance.setHeight(70),
                  child: CustomButton(
                    text: 'Logout',
                    isLoading: userStore.isLoading,
                    onTap: () async {
                      try {
                        await userStore.logout();
                        Navigator.pushNamedAndRemoveUntil(
                            context, SplashPage.routeNamed, (route) => false);
                      } catch (e) {
                        print("error in logout");
                        print(e);
                        showSnackbar(e, context);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
