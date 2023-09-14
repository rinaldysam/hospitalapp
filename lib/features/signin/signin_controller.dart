import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valbury/helper/validation_helper.dart';
import 'package:valbury/routes/app_routes.dart';
import 'package:valbury/widgets/input_widget.dart';
import 'package:valbury/widgets/loading_widget.dart';

class SignInController extends GetxController with StateMixin<int> {
  final pageController = PageController();

  final signinEmailController = VTextFieldController();
  final signinPhoneController = VTextFieldController();
  final signupEmailController = VTextFieldController();
  final signupPhoneController = VTextFieldController();

  Duration entranceDuration = 1.seconds;
  bool isStateSignUp = false;

  @override
  void onInit() async {
    change(0, status: RxStatus.success());
    super.onInit();
    await Future.delayed(entranceDuration);
  }

  void swipeContent() {
    isStateSignUp = !isStateSignUp;
    pageController.animateToPage(
      isStateSignUp ? 0 : 1,
      duration: 250.milliseconds,
      curve: Curves.easeIn,
    );
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email must be filled out.';
    } else if (!ValidationHelper.isEmailValid(value)) {
      return 'Invalid email format.';
    }
    return null;
  }

  String? validatorPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number must be filled out.';
    } else if (!ValidationHelper.isPhoneNumberValid(value)) {
      return 'Invalid phone number format.';
    }
    return null;
  }

  Future<void> onSubmitedSignIn() async {
    LoadingWidget.show();
    await Future.delayed(2.seconds);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', signinEmailController.text);
    await prefs.setString('phone', signinPhoneController.text);
    await prefs.setBool('isLogged', true);
    LoadingWidget.dismiss();
    Get.offAndToNamed(AppRoutes.home);
  }

  Future<void> onSubmitedSignUp() async {
    LoadingWidget.show();
    await Future.delayed(2.seconds);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', signupEmailController.text);
    await prefs.setString('phone', signupPhoneController.text);
    LoadingWidget.dismiss();
    Get.offAndToNamed(AppRoutes.home);
  }
}
