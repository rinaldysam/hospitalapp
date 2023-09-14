import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valbury/routes/app_routes.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> symbolScaleAnimation;
  late Animation<double> letterScaleAnimation;
  late Animation<Offset> sloganTranslationAnimation;
  Duration animationDuration = 3.seconds;

  @override
  void onInit() {
    super.onInit();
    _startAnimations();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await Future.delayed(animationDuration);
    await Future.delayed(1.seconds);

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLogged') == true) {
      Get.offAndToNamed(AppRoutes.home);
    } else {
      Get.offAndToNamed(AppRoutes.signin);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    symbolScaleAnimation = Tween<double>(begin: 100, end: 1).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.3, 0.45, curve: Curves.linear)),
    );

    letterScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 0.9, curve: Curves.easeOutBack)),
    );

    sloganTranslationAnimation = Tween<Offset>(
      begin: Offset(0, Get.context!.height),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
          parent: controller,
          curve: const Interval(0.6, 1.0, curve: Curves.linear)),
    );
    controller.forward();
  }
}
