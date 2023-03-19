import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munch_hub/helper/global_variables.dart';

class ProfileViewModel extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    firstNameController.text = GlobalVariables.userFirstName.value;
    lastNameController.text = GlobalVariables.userLastName.value;
    emailController.text = GlobalVariables.userEmail.value;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
