import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/customprofiletextcard.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: StoreObserver<UserStore>(
              builder: (UserStore userStore, BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                              height: ScreenUtil.instance.setHeight(16),
                            ),

    
                      Container(
                            height: ScreenUtil.instance.setHeight(130),
                               width: ScreenUtil.instance.setWidth(120),
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Styles.BLUE_GREY_COLOR,
                                        blurRadius: 10,
                                        offset: Offset(2, 4))
                                  ],
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage('https://i.pinimg.com/originals/24/37/bd/2437bd9758a684862c11aa9e8f20341a.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(32),
                            ),



                 Text('Name',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:18,
                    fontWeight: FontWeight.w800)),







                CustomProfileTextCard(
                labelText: 'KHX',
                sizelabelText: 16,
                postIcon: Icons.edit,
                visiblepostIcon: true,
                labelTextWeight: FontWeight.w400,
              ),


     Text('Phone Number',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:20,
                    fontWeight: FontWeight.w800)),



                 CustomProfileTextCard(
                labelText: 'dsfgf',
                sizelabelText: 16,
                postIcon: Icons.edit,
                visiblepostIcon: true,
            labelTextWeight: FontWeight.w500,
              ),



Text('Email',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:20,
                    fontWeight: FontWeight.w800)),








             CustomProfileTextCard(
                labelText: 'dsfgf',
                sizelabelText: 16,
                postIcon: Icons.edit,
                visiblepostIcon: true,
                  labelTextWeight: FontWeight.w500,
              ),




Text('Date of birth',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:20,
                    fontWeight: FontWeight.w800)),








             CustomProfileTextCard(
                labelText: 'dsfgf',
                sizelabelText: 16,
                postIcon: Icons.edit,
                visiblepostIcon: true,
               labelTextWeight: FontWeight.w500,
              ),



              Text('password',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:20,
                    fontWeight: FontWeight.w800)),



             CustomProfileTextCard(
                labelText: 'dsfgf',
                sizelabelText: 16,
                postIcon: Icons.edit,
                visiblepostIcon: true,
                  labelTextWeight: FontWeight.w500,
              ),


                        SizedBox(
                              height: ScreenUtil.instance.setHeight(32),
                            ),




                    Container(
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
                            print("error in send otp");
                            print(e);
                            showSnackbar(e, context);
                          }
                        },
                      ),
                    ),





                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
