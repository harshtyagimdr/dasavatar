import 'dart:io';

import 'package:dasavatar_app/model/post.dart';
import 'package:dasavatar_app/model/store_observer.dart';
import 'package:dasavatar_app/presentation/custom/custom_button.dart';
import 'package:dasavatar_app/presentation/custom/custom_image_box.dart';
import 'package:dasavatar_app/presentation/home_page.dart';
import 'package:dasavatar_app/store/post_store.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  Post post = Post();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Styles.WHITE_COLOR,
          body: StoreObserver<PostStore>(
            builder: (PostStore postStore, BuildContext context) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    CustomImageContainer(
                      isLoading: postStore.isUploading,
                      onTap: () async {
                        try {
                          File file = await ImagePicker.pickImage(
                              source: ImageSource.camera);
                          print(file);
                          if (file != null) {
                            String id = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            String url = await postStore.uploadingImage(
                                imageFile: file, id: id);
                            if (url == null) {
                              showToast(msg: "Image Not Verified");
                            } else {
                              showToast(msg: "Image Verified");
                              setState(() {
                                post.id = id;
                                post.imageUrl = url;
                              });
                            }
                          }
                        } catch (e) {
                          print(e);
                          showSnackbar(e.toString(), context);
                        }
                      },
                      image: post.imageUrl,
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Category:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton(
                                    value: post.category,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Any Crime Scene"),
                                        value: "Any Crime Scene",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Group gathering"),
                                        value: "Group Gathering",
                                      ),
                                      DropdownMenuItem(
                                          child: Text("Animal Injured"),
                                          value: "Animal Injured"),
                                      DropdownMenuItem(
                                          child: Text("Others"),
                                          value: "Others"),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        post.category = value;
                                      });
                                    })),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(16),
                    ),
                    Text('Description:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(16),
                    ),
                    TextField(
                      minLines: 3,
                      keyboardType: TextInputType.multiline,
                      onChanged: (v) {
                        post.description = v;
                      },
                      maxLines: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Styles.PRIMARY_COLOR, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Styles.PRIMARY_COLOR, width: 2)),
                        hintText: 'Description',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Show Identity:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        Checkbox(
                            value: post.identity ?? false,
                            onChanged: (v) {
                              setState(() {
                                post.identity = v;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(32),
                    ),
                    CustomButton(
                      text: 'Post',
                      isLoading: postStore.isLoading,
                      onTap: () async {
                        try {
                          if (post.imageUrl != null &&
                              post.category != null &&
                              post.description != null) {
                            await postStore.uploadPost(post: post);
                            showToast(msg: "Posted");
                            setState(() {
                              post = Post();
                            });
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.routeNamed, (route) => false);
                          } else {
                            showToast(msg: "Provide Valid Data");
                          }
                        } catch (e) {
                          showSnackbar(e.toString(), context);
                        }
                      },
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
