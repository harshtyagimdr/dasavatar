import 'package:dasavatar_app/presentation/splashpage.dart';
import 'package:dasavatar_app/store/user_store.dart';
import 'package:dasavatar_app/utils/string_values.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(Dasavatar());
}

class Dasavatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
      ],
      child: MaterialApp(
          title: StringValues.APP_NAME,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          initialRoute: SplashPage.routeNamed,
          routes: {
            SplashPage.routeNamed: (BuildContext context) => SplashPage(),
          }),
    );
  }
}
