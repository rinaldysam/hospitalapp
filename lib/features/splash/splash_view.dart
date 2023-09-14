import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width / 2.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: size,
            height: size,
            child: Hero(
              tag: 'logo-hero',
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: AnimatedBuilder(
                        animation: controller.letterScaleAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: controller.letterScaleAnimation.value,
                            child: Image.asset(
                              'assets/images/ic-logo-part-alphabet.png',
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: AnimatedBuilder(
                        animation: controller.symbolScaleAnimation,
                        builder: (context, child) {
                          double value = controller.symbolScaleAnimation.value;
                          return Transform.scale(
                              scale: value,
                              child: Opacity(
                                opacity: 1 - (value / 100),
                                child: Image.asset(
                                  'assets/images/ic-logo-part-symbol.png',
                                ),
                              ));
                        }),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: AnimatedBuilder(
                        animation: controller.sloganTranslationAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: controller.sloganTranslationAnimation.value,
                            child: Image.asset(
                              'assets/images/ic-logo-part-name.png',
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
