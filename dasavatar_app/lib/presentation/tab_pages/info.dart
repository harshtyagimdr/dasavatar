import 'package:dasavatar_app/presentation/custom/customlogo.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Center(
                      child: CustomLogo(
                    url: 'assets/logo.jpeg',
                  )),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About',
                      style: TextStyle(
                          color: Styles.BLUE_GREY_COLOR,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Container(
                    child: Text(
                      'We often come across news and situations where we find people struggling like in a road accident or community gatherings during these pandemic times or someone else who needs help urgently but due to some reason, we ourselves can’t help them. From here we got the idea of developing something which people can use to help others when they can’t. Just by installing our app, people would be able to capture the photo of the scene and upload it on our platform where other people as well as certain emergency facility providers would be available. Anyone within the range of approx. 10 km would be notified of that incident happening and the required help can reach them well in time. Also, to make it a dependable app, we have applied certain machine learning algorithm which upon upload of photo and selection of category would verify whether the selected category for that photo is legitimate or not and then only would it be posted. Also, the users would be given an option of hiding their identity while posting photo, as many times people are afraid of reporting certain situation or crimes.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Meet Our Team',
                      style: TextStyle(
                          color: Styles.BLUE_GREY_COLOR,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(16),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomLogo(
                              url: 'assets/harsh2.jpeg',
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Harsh Agarwal',
                                style: TextStyle(
                                    color: Styles.BLUE_GREY_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              width: ScreenUtil.instance.setWidth(120),
                              child: Text(
                                'Web and App Developer',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLogo(
                              url: 'assets/harsh1.jpeg',
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Harsh Tyagi',
                                style: TextStyle(
                                    color: Styles.BLUE_GREY_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              width: ScreenUtil.instance.setWidth(120),
                              child: Text(
                                'Web and App Developer',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(16),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLogo(
                              url: 'assets/alankar.jpeg',
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Alankar Saxena',
                                style: TextStyle(
                                    color: Styles.BLUE_GREY_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              width: ScreenUtil.instance.setWidth(120),
                              child: Text(
                                'Full Stack Web Developer',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLogo(
                              url: 'assets/kartik.jpg',
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Kartikeya Sharma',
                                style: TextStyle(
                                    color: Styles.BLUE_GREY_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(5),
                            ),
                            Container(
                              width: ScreenUtil.instance.setWidth(120),
                              child: Text(
                                'Web and App developer',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Advantages',
                      style: TextStyle(
                          color: Styles.BLUE_GREY_COLOR,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Container(
                    child: Text(
                      '1: In today’s covid-19 situation, mass gathering could be reported just by the use of fingertips so that police may take the required action.\n2: Crimes like kidnapping and theft can be anonymously reported.\n3: At the time of accident, any person nearby or hospital could help the injured in time and save his/her life.\n4: People know what’s happening around the world but don’t know if a robbery or accident took place in the next lane, the 10 km notification thing would help them know and if possible they could help as well. Maybe the incident could have happened with their loved ones.\n5: It is simple to use and convenient as everyone today has a smartphone with a camera and an internet connection.\n',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Features',
                      style: TextStyle(
                          color: Styles.BLUE_GREY_COLOR,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Container(
                    child: Text(
                      '1. feed part: In which all registered user can see the post which will be within radius of 10 km. \n2. create post: If anyone is seeing something wrong there then they will be able to generate post. \n3. Profile: In which user can see and update thier personal details. \n',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Technology Stack',
                      style: TextStyle(
                          color: Styles.BLUE_GREY_COLOR,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Container(
                    child: Text(
                      '1: Flutter for Application development.\n2: React for website.\n3: Firebase for database.\n4: ML for recognization part.\n',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(32),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
