import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/screens/splash/splash_view.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // status bar color
      statusBarBrightness: Brightness.light, //status bar brightness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    ),
  );

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.palette1,
        scaffoldBackgroundColor: const Color(0xffF3F6F9),
        fontFamily: 'Nunito',
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      home: SplashView(),
    );
  }
}

class Palette {
  static const MaterialColor palette1 = MaterialColor(
    _palette1PrimaryValue,
    <int, Color>{
      50: Color(0xFFFBE8E9),
      100: Color(0xFFF6C5C7),
      200: Color(0xFFF09FA2),
      300: Color(0xFFEA797D),
      400: Color(0xFFE65C61),
      500: Color(_palette1PrimaryValue),
      600: Color(0xFFDD393E),
      700: Color(0xFFD93136),
      800: Color(0xFFD5292E),
      900: Color(0xFFCD1B1F),
    },
  );
  static const int _palette1PrimaryValue = 0xFFE13F45;
}
