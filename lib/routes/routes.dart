import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/forgetPassword/forgetpassword.dart';
import 'package:shapmanpaypoint/Screens/login/login.dart';
import 'package:shapmanpaypoint/components/otpScreen/otp.dart';
import 'package:shapmanpaypoint/Screens/login/signinScreen/signIn.dart';
import 'package:shapmanpaypoint/Screens/onboardingslider/onboadingslider.dart';
import 'package:shapmanpaypoint/Screens/signup/completionScreen/completionScreen.dart';
import 'package:shapmanpaypoint/Screens/signup/signup.dart';

import '../Screens/signup/pinInsertion/pin.dart';

final pages = [
  GetPage(name: '/home', page: () => LoginScreen()),
  GetPage(name: '/signin', page: () => SignIn()),
  GetPage(name: '/otp', page: () => OtpScreen()),
  GetPage(name: '/forgetpassword', page: () => ForgetPassword()),
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/completeScreen', page: () => CompletionScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/insertpin', page: () => PinScreen()),
];
