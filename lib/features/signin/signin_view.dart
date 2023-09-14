import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury/widgets/button_widget.dart';
import 'package:valbury/widgets/input_widget.dart';
import 'signin_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});

  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var logoSize = size.width / 4;

    double safeAreaHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (_) => SingleChildScrollView(
            child: SizedBox(
              height: screenHeight - safeAreaHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Hero(
                      tag: 'logo-hero',
                      child: Image.asset(
                        'assets/images/ic-logo.png',
                        height: logoSize,
                        width: logoSize,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TweenAnimationBuilder(
                      duration: 2.seconds,
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, double? value, child) {
                        return Opacity(
                          opacity: value!,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.pageController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Form(
                                key: _formSignInKey,
                                child: _renderSignInWidget(),
                              ),
                              Form(
                                key: _formSignUpKey,
                                child: _renderSignUpWidget(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderSignInWidget() {
    return Column(
      children: [
        const Text(
          'SIGN IN',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ).paddingAll(16),
        VTextField(
          controller: controller.signinEmailController,
          labelText: 'Email:',
          hint: 'Input your email',
          validator: controller.validatorEmail,
        ),
        VTextField(
          controller: controller.signinPhoneController,
          labelText: 'Phone Number:',
          hint: 'Input your phone number',
          validator: controller.validatorPhone,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: controller.swipeContent,
              child: const Text("Create One"),
            )
          ],
        ).paddingSymmetric(horizontal: 16),
        const Spacer(),
        ButtonWidget(
          buttonText: 'SIGN IN',
          onPressed: () {
            if (_formSignInKey.currentState!.validate()) {
              _formSignInKey.currentState!.save();
              controller.onSubmitedSignIn();
            }
          },
        )
      ],
    );
  }

  Widget _renderSignUpWidget() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'SIGN UP',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        VTextField(
          controller: controller.signupEmailController,
          labelText: 'Email:',
          hint: 'Input your email',
          validator: controller.validatorEmail,
        ),
        VTextField(
          controller: controller.signupPhoneController,
          labelText: 'Phone Number:',
          hint: 'Input your phone number',
          keyboardType: TextInputType.phone,
          validator: controller.validatorPhone,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Have an account?"),
              TextButton(
                onPressed: controller.swipeContent,
                child: const Text("Sign In"),
              )
            ],
          ),
        ),
        const Spacer(),
        ButtonWidget(
          buttonText: 'SIGN UP',
          onPressed: () {
            if (_formSignUpKey.currentState!.validate()) {
              _formSignUpKey.currentState!.save();
              controller.onSubmitedSignUp();
            }
          },
        )
      ],
    );
  }
}
