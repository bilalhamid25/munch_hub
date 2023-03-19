import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:munch_hub/helper/api_base_helper.dart';
import 'package:munch_hub/helper/getx_helper.dart';
import 'package:munch_hub/helper/global_variables.dart';
import 'package:munch_hub/helper/urls.dart';
import 'package:munch_hub/widgets/loader.dart';

class SignUpViewModel extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validateTextField(String? value) {
    if (GetUtils.isBlank(value)!) {
      return "Field required";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (!GetUtils.isEmail(value!)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 8) {
      return "Password must be at least 8 character/digit";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Password does not match";
    } else {
      return null;
    }
  }

  void registerUser() async {
    if (signupFormKey.currentState!.validate()) {
      Loader.loader.value = true;
      Map<String, dynamic> body = {
        "email": emailController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text
      };
      ApiBaseHelper()
          .post(url: URLs.register, body: body)
          .then((responseJson) async {
        try {
          if (responseJson["success"] == true) {

            GlobalVariables.token.value = responseJson['access_token'];
            GlobalVariables.userFirstName.value = responseJson['user']['first_name'];
            GlobalVariables.userLastName.value = responseJson['user']['last_name'];
            GlobalVariables.userEmail.value = responseJson['user']['email'];

            GetStorage().write("token", responseJson['access_token']);
            GetStorage().write("userFirstName", responseJson['user']['first_name']);
            GetStorage().write("userLastName", responseJson['user']['last_name']);
            GetStorage().write("userEmail", responseJson['user']['email']);

            Get.back();
            GetxHelper.showSnackBar1(
                title: "Successful", message: "User created");
          } else {
            GetxHelper.showSnackBar1(
                title: "Registration Failed",
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
