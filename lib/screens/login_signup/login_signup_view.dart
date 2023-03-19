import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/screens/login/login_view.dart';
import 'package:munch_hub/screens/signup/signup_view.dart';
import 'package:munch_hub/widgets/custom_buttons.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: double.infinity,
          padding:
              EdgeInsets.fromLTRB(Get.width * 0.2, 20, Get.width * 0.2, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.key,
                size: Get.width * 0.4,
                color: Colors.grey,
              ),
              const Text(
                "You must sign-in to access\nto this section",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomButton1(
                  backgroundColor: const Color(0xffE13F45),
                  text: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> SignUpView());
                }, // needed
                child: const Text(
                  "Don't have an account? Create",
                  style: TextStyle(
                    color: Color(0xff031F4B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
