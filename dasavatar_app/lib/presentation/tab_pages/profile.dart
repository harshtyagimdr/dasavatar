import 'dart:io';

import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/model/user.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/customlogo.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit = false;
  User user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      user = Provider.of<UserStore>(context, listen: false).loggedInUser;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.WHITE_COLOR,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: StoreObserver<UserStore>(
            builder: (UserStore userStore, BuildContext context) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: ScreenUtil.instance.setWidth(120),
                    height: ScreenUtil.instance.setWidth(120),
                    child: Stack(
                      children: [
                        CustomLogo(url: user.imgUrl),
                        edit
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      File file = await ImagePicker.pickImage(
                                          source: ImageSource.camera);
                                      print(file);
                                      if (file != null) {
                                        String url =
                                            await userStore.uploadingImage(
                                                imageFile: file, id: user.uid);
                                        if (url == null) {
                                          showToast(msg: "Image Not Verified");
                                        } else {
                                          showToast(msg: "Image Verified");
                                          setState(() {
                                            user.imgUrl = url;
                                          });
                                        }
                                      }
                                    } catch (e) {
                                      print(e);
                                      showSnackbar(e.toString(), context);
                                    }
                                  },
                                  child: Container(
                                    height: ScreenUtil.instance.setWidth(30),
                                    width: ScreenUtil.instance.setWidth(30),
                                    decoration: BoxDecoration(
                                        color: Styles.PRIMARY_COLOR,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.edit,
                                      color: Styles.WHITE_COLOR,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(child: !edit ? _showForm(userStore) : _editForm()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () async {
                          if (userStore.isUploading) {
                            showToast(msg: 'Profile Pic is Uploading');
                            return;
                          }
                          if (edit) {
                            await userStore.updatedUser(user: user);
                          }
                          setState(() {
                            edit = !edit;
                          });
                        },
                        backgroundColor: Styles.PRIMARY_COLOR,
                        child: userStore.isLoading
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Styles.WHITE_COLOR),
                              )
                            : !edit
                                ? Icon(Icons.edit)
                                : Icon(Icons.check),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(64),
                  ),
                  !edit
                      ? Container(
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
                                print("error in logout");
                                print(e);
                                showSnackbar(e.toString(), context);
                              }
                            },
                          ),
                        )
                      : SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _editForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenUtil.instance.setHeight(48),
        ),
        Text('Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomTextField(
          hintText: 'Name',
          initialValue: user.name,
          onChanged: (value) {
            user.name = value;
          },
        ),
        Text('Date Of Birth',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
        Text('Phone Number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomTextField(
          hintText: 'Phone Number',
          validator: validatePhone,
          initialValue: user.phoneNumber,
          onChanged: (value) {
            user.phoneNumber = value;
          },
          textInputType: TextInputType.phone,
        ),
      ],
    );
  }

  _showForm(UserStore userStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenUtil.instance.setHeight(48),
        ),
        Text('Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: userStore.loggedInUser.name ?? '',
          sizelabelText: 20,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Phone Number',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: userStore.loggedInUser.phoneNumber ?? '',
          sizelabelText: 20,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Email',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: userStore.loggedInUser.email ?? '',
          sizelabelText: 20,
          labelTextWeight: FontWeight.w300,
        ),
        Text('Date Of Birth',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        CustomProfileTextCard(
          labelText: userStore.loggedInUser.dob ?? '',
          sizelabelText: 20,
          labelTextWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
