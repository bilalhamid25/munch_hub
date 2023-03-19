import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:munch_hub/screens/login/login_viewmodel.dart';
import 'package:munch_hub/screens/signup/signup_view.dart';
import 'package:munch_hub/widgets/custom_text_fields.dart';
import 'package:munch_hub/widgets/custom_buttons.dart';
import 'package:munch_hub/widgets/ibackground4.dart';
import 'package:munch_hub/widgets/loader.dart';
// import 'package:munch_hub/widgets/scrolable_column.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel loginViewModel = Get.put(LoginViewModel());

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar(),
        body: Stack(
          children: [
            IBackground4(
              width: MediaQuery.of(context).size.width,
              colorsGradient: const [Color(0xff99A0F9), Color(0xff0D1FFE)],
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      logoImage(),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Form(
                        key: loginViewModel.loginFormKey,
                        child: Column(
                          children: [
                            emailTextField(),
                            passwordTextField(),
                          ],
                        ),
                      ),
                      loginButton(),
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                      //   child: Row(
                      //     children: const [
                      //       Expanded(child: Divider(color: Colors.white)),
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 5),
                      //         child: Text(
                      //           'or',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold, color: Colors.white),
                      //         ),
                      //       ),
                      //       Expanded(child: Divider(color: Colors.white)),
                      //     ],
                      //   ),
                      // ),
                      // facebookButton(),
                      // googleButton(),
                      dontHaveAnAccountText(),
                      forgetPasswordText(),
                    ],
                  ),
                ),
              ),
            ),
            const Loader()
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  Widget logoImage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 40),
      child: Image(
        width: Get.width * 0.25,
        image: const AssetImage('assets/images/logo.png'),
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomTextField1(
        hint: 'E-mail address',
        prefixIcon: FontAwesomeIcons.at,
        controller: loginViewModel.emailController,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return loginViewModel.validateTextField(value);
        },
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomTextField1(
        hint: 'Password',
        prefixIcon: FontAwesomeIcons.key,
        obscureText: true,
        controller: loginViewModel.passwordController,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return loginViewModel.validateTextField(value);
        },
      ),
    );
  }

  Widget loginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: CustomButton1(
        width: Get.width * 0.8,
        backgroundColor: const Color(0xffE13F45),
        text: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          loginViewModel.login();
        },
      ),
    );
  }

  Widget facebookButton() {
    return SocialButton(
      width: Get.width * 0.8,
      text: 'Log in with Google',
      onPressed: () {},
      icon: FontAwesomeIcons.google,
      backgroundColor: const Color(0xffD44C3D),
    );
  }

  Widget googleButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SocialButton(
        width: Get.width * 0.8,
        text: 'Log in with Facebook',
        onPressed: () {},
        icon: FontAwesomeIcons.facebookF,
        backgroundColor: const Color(0xff4867AA),
      ),
    );
  }

  Widget dontHaveAnAccountText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: InkWell(
        onTap: () {
          Get.off(() => SignUpView());
        },
        child: const Text(
          'Don\'t have an account? Create',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  Widget forgetPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 20),
      child: InkWell(
        onTap: () {
          // Get.off(() => SignUp1View());
        },
        child: const Text(
          'Forget Password',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
