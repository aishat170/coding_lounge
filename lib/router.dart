import 'package:get/get.dart';
import 'package:take_note/bindings/data_binding.dart';
import 'package:take_note/screens/home_screen.dart';
import 'package:take_note/screens/login_screen.dart';
import 'package:take_note/screens/onboarding.dart';

final List<GetPage> appScreens = [
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/auth', page: () => LoginScreen(), binding: (DataBinding())),
  GetPage(name: '/home', page: () => HomeScreen()),
];