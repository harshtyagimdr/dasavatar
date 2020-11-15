import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/customprofiletextcard.dart';
import 'package:dasavatar_app/presentation/custom/customtextfield.dart';
import 'package:dasavatar_app/presentation/splash_page.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit = false;
  String name;
  String dob;
  String phoneNumber;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Styles.WHITE_COLOR,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: StoreObserver<UserStore>(
                builder: (UserStore userStore, BuildContext context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
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
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/24/37/bd/2437bd9758a684862c11aa9e8f20341a.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.instance.setHeight(32),
                      ),
                      Container(
                          child: (edit == false) ? _showForm() : _editForm()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (edit == false)
                                  edit = true;
                                else
                                  edit = false;
                              });
                            },
                            backgroundColor: Styles.PRIMARY_COLOR,
                            child: (edit == false)?Icon(Icons.edit):Icon(Icons.check),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.instance.setHeight(64),
                      ),
                      Container(child: (edit == false)?
                                               Container(
                          height: ScreenUtil.instance.setHeight(70),
                          child: CustomButton(
                            text: 'Logout',
                            isLoading: userStore.isLoading,
                            onTap: () async {
                              try {
                                await userStore.logout();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    SplashPage.routeNamed, (route) => false);
                              } catch (e) {
                                print("error in send otp");
                                print(e);
                                showSnackbar(e, context);
                              }
                            },
                          ),
                        ):Container(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _editForm() {
    return Column(
      children: [
         SizedBox(
          height: ScreenUtil.instance.setHeight(48),
        ),
        CustomTextField(
          hintText: 'Name',
          onSaved: (value) {
            name = value;
          },
        ),
        InkWell(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate:
                        dob != null ? DateTime.parse(dob) : DateTime.now(),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime.now())
                .then((value) {
              if (value != null) {
                setState(() {
                  dob = DateFormat('yyyy-MM-dd').format(value);
                });
              }
            });
          },
          child: IgnorePointer(
            child: CustomTextField(
              hintText: dob ?? 'Date Of Birth',
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
            phoneNumber = value;
          },
          textInputType: TextInputType.phone,
        ),
        CustomTextField(
          hintText: 'Email',
          validator: validateEmail,
          onSaved: (value) {
            email = value;
          },
        ),
      ],
    );
  }

  _showForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenUtil.instance.setHeight(48),
        ),
        Text('Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: 'KHX',
          sizelabelText: 20,
          postIcon: Icons.edit,
          visiblepostIcon: false,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Phone Number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: 'dsfgf',
          sizelabelText: 20,
          postIcon: Icons.edit,
          visiblepostIcon: false,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Email',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: 'dsfgf',
          sizelabelText: 20,
          postIcon: Icons.edit,
          visiblepostIcon: false,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Date of birth',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: 'dsfgf',
          sizelabelText: 20,
          postIcon: Icons.edit,
          visiblepostIcon: false,
          labelTextWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
