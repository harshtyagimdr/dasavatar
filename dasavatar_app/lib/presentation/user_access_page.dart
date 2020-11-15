import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/model/user.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/customlogo.dart';
import 'package:dasavatar_app/presentation/custom/customtextfield.dart';
import 'package:dasavatar_app/presentation/splash_page.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UserAccessPage extends StatefulWidget {
  static const String routeNamed = 'UserAccessPage';

  @override
  _UserAccessPageState createState() => _UserAccessPageState();
}

class _UserAccessPageState extends State<UserAccessPage> {
  User user = User();
  String password;
  bool isSignUp = false;

  final GlobalKey<FormState> _signUPForm = GlobalKey<FormState>();
  final GlobalKey<FormState> _signINFrom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: StoreObserver<UserStore>(
            builder: (UserStore userStore, BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             

              Expanded(
                 
                child: SingleChildScrollView(
                  child: isSignUp
                      ? _signUpWidget(userStore)
                      : _signInWidget(userStore),
                ),
              ),
              CustomButton(
                onTap: () {
                  setState(() {
                    isSignUp = !isSignUp;
                  });
                },
                text: isSignUp
                    ? 'Already Have an account!\nSign In'
                    : 'Don\'t Have an account!\nSign Up',
                textColor: Styles.BLACK_COLOR,
                buttonColor: Styles.TRANSPARENT_COLOR,
                fontSize: 14,
              ),
            ],
          );
        }),
      ),
    );
  }

  _signUpWidget(UserStore userStore) {
    return Container(
      key: Key('SIGN UP'),
      margin:
          EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
      child: Form(
        key: _signUPForm,
        child: Column(
          children: <Widget>[
             SizedBox(
                height: ScreenUtil.instance.setHeight(32),
              ),

                  Center(
                          child: CustomLogo(
                            url: 'assets/logo.jpeg',
                            profile: true,
                          )),
            SizedBox(
              height: ScreenUtil.instance.setHeight(50),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign Up',
                style: TextStyle(color: Styles.BLUE_GREY_COLOR, fontSize: 18 ,fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            CustomTextField(
              hintText: 'Name',
              onSaved: (value) {
                user.name = value;
              },
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: user.dob != null
                            ? DateTime.parse(user.dob)
                            : DateTime.now(),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime.now())
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      user.dob = DateFormat('yyyy-MM-dd').format(value);
                    });
                  }
                });
              },
              child: IgnorePointer(
                child: CustomTextField(
                  hintText: user.dob ?? 'Date Of Birth',
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Phone Number',
              validator: validatePhone,
              onSaved: (value) {
                user.phoneNumber = value;
              },
              textInputType: TextInputType.phone,
            ),
            CustomTextField(
              hintText: 'Email',
              validator: validateEmail,
              onSaved: (value) {
                user.email = value;
              },
            ),
            CustomTextField(
              hintText: 'Password',
              onSaved: (value) {
                password = value;
              },
               obstruct: false
            ),
            CustomButton(
              text: 'Sign Up',
              isLoading: userStore.isLoading,
              onTap: () async {
                _signUPForm.currentState.save();
                if (_signUPForm.currentState.validate()) {
                  try {
                    await userStore.signUp(user: user, password: password);
                    _navigateToSplashPage();
                  } catch (e) {
                    print("signup error");
                    print(e);
                    showSnackbar(e, context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _signInWidget(UserStore userStore) {
    return Container(
      key: Key('SIGN IN'),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(30),
      ),
      child: Form(
        key: _signINFrom,
        child: Column(
          children: <Widget>[
             SizedBox(
                height: ScreenUtil.instance.setHeight(32),
              ),

                  Center(
                          child: CustomLogo(
                            url: 'assets/logo.jpeg',
                            profile: true,
                          )),
            SizedBox(
              height: ScreenUtil.instance.setHeight(100),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign In',
                style: TextStyle(color: Styles.BLUE_GREY_COLOR, fontSize: 18 ,fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
            ),
            CustomTextField(
              hintText: 'Email',
              validator: validateEmail,
              onSaved: (value) {
                user.email = value;
              },
            ),
            CustomTextField(
              hintText: 'Password',
              onSaved: (value) {
                password = value;
              },
              obstruct: false,
              
            ),
            CustomButton(
              text: 'Submit',
              isLoading: userStore.isLoading,
              onTap: () async {
                _signINFrom.currentState.save();
                if (_signINFrom.currentState.validate()) {
                  try {
                    await userStore.login(
                        email: user.email, password: password);
                    _navigateToSplashPage();
                  } catch (e) {
                    print("error in login");
                    print(e);
                    showSnackbar(e, context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _navigateToSplashPage() {
    Navigator.pushNamedAndRemoveUntil(
        context, SplashPage.routeNamed, (route) => false);
  }
}
