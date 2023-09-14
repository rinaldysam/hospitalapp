import 'package:get/get.dart';
import 'package:valbury/features/home/home_controller.dart';
import 'package:valbury/features/home/home_view.dart';
import 'package:valbury/features/signin/signin_controller.dart';
import 'package:valbury/features/signin/signin_view.dart';
import 'package:valbury/features/splash/splash_controller.dart';
import 'package:valbury/features/splash/splash_view.dart';

class AppRoutes {
  static String splash = '/splash';
  static String signin = '/signin';
  static String home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SplashController());
      }),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: signin,
      page: () => SignInView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignInController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: 1.seconds,
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: 1.seconds,
    ),
  ];
}
