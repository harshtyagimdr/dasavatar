import 'package:dasavatar_app/presentation/splashpage.dart';
import 'package:dasavatar_app/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(Dasavatar());

class Dasavatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: StringValues.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white,),
        initialRoute: SplashPage.routeNamed,
        routes: {
             SplashPage.routeNamed: (BuildContext context) => SplashPage(),
        });
  }
}
