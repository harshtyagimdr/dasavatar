import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = 'SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int currentPage;
  _getBody() {
    switch (currentPage) {
      case 0:
        return HomePage();
        break;
      case 1:
        return Post();
        break;
      case 2:
        return Profile();
        break;
      default:
        return HomePage();
    }
  }

  _getBottomBar() {
    return Container(
      child: Card(
        elevation: 250,
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
                index: 0, icontab: Icons.home, text: Strings.HOME),
            _getBottomBarItem(
                index: 1,
                icontab: Icons.youtube_searched_for,
                text: Strings.SEARCH),
            _getBottomBarItem(
                index: 2, icontab: Icons.shopping_cart, text: Strings.CART),
            _getBottomBarItem(
                index: 3, icontab: Icons.more_horiz, text: Strings.MORE),
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
          currentPage = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: currentPage == index
                  ? BorderSide(
                      width: ScreenUtil.instance.setHeight(5),
                      color: Styles.BOTTOMNAVIGATIONBAR_BOTTOM_BORDER_COLOR)
                  : BorderSide(
                      width: ScreenUtil.instance.setHeight(0),
                      color: Colors.transparent)),
        ),
        alignment: Alignment.center,
        height: ScreenUtil.instance.setHeight(65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Icon(
                  icontab,
                  color: Styles.BOTTOMNAVIGATIONBAR_ICON_COLOR,
                  size: ScreenUtil.instance.setHeight(32),
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        height: defaultHeight, width: defaultWidth, allowFontScaling: false)
      ..init(context);
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
