import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/widgets/ibackground4.dart';
import 'package:munch_hub/screens/splash/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  final SplashViewModel splashViewModel = Get.put(SplashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        IBackground4(
          width: MediaQuery.of(context).size.width,
          colorsGradient: const [Color(0x50668798), Color(0xff668798)],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Image(
                  width: Get.width * 0.3,
                  image: const AssetImage("assets/images/logo.png"),
                ),
              ),
              const CircularProgressIndicator(
                backgroundColor: Color(0xff009688),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 1,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
