import 'package:get/get.dart';
import 'package:shapmanpaypoint/Binding/electric_binding.dart';
import 'package:shapmanpaypoint/Binding/signup_binding.dart';
import 'package:shapmanpaypoint/Middleware/auth_middleware.dart';
import 'package:shapmanpaypoint/Middleware/idle_middleware.dart';
import 'package:shapmanpaypoint/Screens/funding/PaymentMethod.dart';
import 'package:shapmanpaypoint/Screens/funding/component/bank_transfer.dart';

import 'package:shapmanpaypoint/Screens/login/forgetPassword/forgetpassword.dart';
import 'package:shapmanpaypoint/Screens/login/login.dart';
import 'package:shapmanpaypoint/Screens/profile/profile.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/data_bundle.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/electricityScreen.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/gift_card.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/PaymentReview/payment_review.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/completed/giftcard_completed.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/rechargecardndata/recharge_screen.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/serviceScreen.dart';
import 'package:shapmanpaypoint/Screens/signup/pinInsertion/pin2.dart';
import 'package:shapmanpaypoint/Screens/signup/selectAvatar/selectavatar.dart';
import 'package:shapmanpaypoint/widgets/otpScreen/loginotp.dart';
import 'package:shapmanpaypoint/widgets/otpScreen/otp.dart';
import 'package:shapmanpaypoint/Screens/login/signinScreen/signIn.dart';
import 'package:shapmanpaypoint/Screens/onboardingslider/onboadingslider.dart';
import 'package:shapmanpaypoint/Screens/signup/completionScreen/completionScreen.dart';
import 'package:shapmanpaypoint/Screens/signup/signup.dart';
import 'package:shapmanpaypoint/widgets/paymentReview/successPay.dart';
import 'package:shapmanpaypoint/widgets/singlePurchasedItem/single_purchased_item.dart';

import '../Screens/funding/component/paymentsummary.dart';
import '../Screens/signup/pinInsertion/pin.dart';
import '../widgets/Layout/Layout.dart';

final pages = [
  GetPage(name: '/home', page: () => const LoginScreen()),
  GetPage(name: '/signin', page: () => SignIn()),
  GetPage(name: '/otp', page: () => OtpScreen()),
  GetPage(name: '/otplogin', page: () => LoginOtpScreen()),
  GetPage(name: '/forgetpassword', page: () => ForgetPassword()),
  GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
  GetPage(name: '/completeScreen', page: () => const CompletionScreen()),
  GetPage(
      name: '/signup', page: () => SignupScreen(), binding: SignupBinding()),
  GetPage(name: '/insertpin', page: () => PinScreen()),
  GetPage(name: '/Confirmpin', page: () => ConfirmPinScreen()),
  GetPage(name: '/selectavatar', page: () => const SelectAvatar()),
  GetPage(
      name: '/dashboard',
      page: () => LayoutScreen(),
      binding: DashElectricBinding(),
      middlewares: [IdleMiddleware(), AuthMiddleWare()]),
  GetPage(name: '/service', page: () => const ServiceScreen()),
  GetPage(name: '/profile', page: () => const ProfileScreen()),
  GetPage(name: '/recharge', page: () => RechargeCard()),
  GetPage(name: '/data', page: () => DataBundleScreen()),
  GetPage(name: '/funding', page: () => const PaymentMethod()),
  GetPage(name: '/banktransfer', page: () => BankTransfer()),
  GetPage(name: '/paymentsummary', page: () => const PaymentSummary()),
  GetPage(name: '/utility', page: () => Electric(), binding: ElectricBinding()),
  GetPage(
    name: '/utilityreview',
    page: () => SuccessPay(),
  ),
  GetPage(
    name: '/giftcardpaymentreview',
    page: () => PaymentReviewGiftCard(),
  ),
  GetPage(name: '/singlePurchase', page: () => const SinglePurchasedItemPage()),
  GetPage(name: '/giftcard', page: () => GiftCard()),
  GetPage(name: '/giftcard/final', page: () => GiftCardCompletedAmount())
];
