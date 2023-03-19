import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/helper/api_base_helper.dart';
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/widgets/loader.dart';

class LoginViewModel extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void onReady() {
  //   super.onReady();
  //
  //   //remove later
  // emailController.text = "mohsinnaqvi606@gmail.com";
  // passwordController.text = "12345678";
  // }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateTextField(String? value) {
    if (GetUtils.isBlank(value)!) {
      return "Field required";
    } else {
      return null;
    }
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      Loader.loader.value = true;
      Map<String, dynamic> body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      ApiBaseHelper()
          .post(url: URLs.login, body: body)
          .then((responseJson) async {
        try {
          if (responseJson["success"] == true) {
            Get.back();
            GlobalVariables.token.value = responseJson['access_token'];
            GlobalVariables.userFirstName.value =
                responseJson['user']['first_name'];
            GlobalVariables.userLastName.value =
                responseJson['user']['last_name'];
            GlobalVariables.userEmail.value = responseJson['user']['email'];

            GetStorage().write("token", responseJson['access_token']);
            GetStorage()
                .write("userFirstName", responseJson['user']['first_name']);
            GetStorage()
                .write("userLastName", responseJson['user']['last_name']);
            GetStorage().write("userEmail", responseJson['user']['email']);

            GetxHelper.showSnackBar1(
                title: "Logged In", message: "Welcome Back");
          } else {
            GetxHelper.showSnackBar1(
                title: "Login Failed!",
                message: responseJson['errors'].toString());
          }
          Loader.loader.value = false;
        } catch (e) {
          Loader.loader.value = false;
          GetxHelper.showSnackBar1(title: 'Error', message: e.toString());
        }
      });
    }
  }
}
