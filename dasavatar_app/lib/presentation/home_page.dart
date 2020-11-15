import 'package:dasavatar_app/presentation/tab_pages/add_post_page.dart';
import 'package:dasavatar_app/presentation/tab_pages/feed.dart';
import 'package:dasavatar_app/presentation/tab_pages/info.dart';
import 'package:dasavatar_app/presentation/tab_pages/profile.dart';
import 'package:dasavatar_app/utils/string_values.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  _getBody() {
    switch (_currentPage) {
      case 0:
        return Feed();
        break;
      case 1:
        return AddPostPage();
        break;
      case 2:
        return Profile();
        break;
      case 3:
        return Info();
        break;
      default:
        return Feed();
    }
  }

  _getBottomBar() {
    return Container(
      child: Card(
        elevation: 250,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil.instance.setHeight(8)),
              topRight: Radius.circular(ScreenUtil.instance.setHeight(8))),
        ),
        margin: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _getBottomBarItem(
                index: 0, icontab: Icons.feedback, text: StringValues.FEED),
            _getBottomBarItem(
                index: 1, icontab: Icons.add, text: StringValues.POST),
            _getBottomBarItem(
                index: 2,
                icontab: Icons.account_circle,
                text: StringValues.PROFILE),
            _getBottomBarItem(index: 3, icontab: Icons.info, text: 'About'),
          ],
        ),
      ),
    );
  }

  _getBottomBarItem({
    int index,
    IconData icontab,
    String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentPage = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: _currentPage == index
                  ? BorderSide(
                      width: ScreenUtil.instance.setHeight(5),
                      color: Styles.PRIMARY_COLOR)
                  : BorderSide(
                      width: ScreenUtil.instance.setHeight(0),
                      color: Colors.transparent)),
        ),
        alignment: Alignment.center,
        height: ScreenUtil.instance.setHeight(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Icon(
                  icontab,
                  color: Styles.BLUE_GREY_COLOR,
                  size: (text == StringValues.POST)
                      ? ScreenUtil.instance.setHeight(34)
                      : ScreenUtil.instance.setHeight(32),
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[Expanded(child: _getBody()), _getBottomBar()],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
