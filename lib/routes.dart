import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/view/screens/auth/forgetpassword/forgetpasswordscreen.dart';
import 'package:delivery_e_commerce/view/screens/auth/forgetpassword/sucessressetpasswordscreen.dart';
import 'package:delivery_e_commerce/view/screens/auth/login.dart';
import 'package:delivery_e_commerce/view/screens/languagescreen.dart';
import 'package:delivery_e_commerce/view/screens/orders/archive.dart';
import 'package:delivery_e_commerce/view/screens/orders/ordertrackingscreen.dart';
import 'package:delivery_e_commerce/view/screens/orders/pendings.dart';
import 'package:delivery_e_commerce/view/screens/orders/orderdetails.dart';
import 'package:delivery_e_commerce/view/screens/pagesinhomescreen/homescreen.dart';

import 'package:get/get.dart';

import 'core/middleware/mymiddleware.dart';
import 'view/screens/auth/forgetpassword/resetpasswordscreen.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const LogInScreen(), middlewares: [MyMiddleWare()]),

  GetPage(name: Approutes.login, page: () => const LogInScreen()),
  // GetPage(name: "/", page: () => Test()),

  //GetPage(name: Approutes.onboarding, page: () => const OnBoardingScreen()),

  //GetPage(name: Approutes.signup, page: () => const SignUpScreen()),
  GetPage(name: Approutes.forgetpassword, page: () => const ForgetPasswordScreen()),
  // GetPage(name: Approutes.verifycode, page: () => const VerifyCodeScreen()),
  GetPage(name: Approutes.ressetpassword, page: () => const RessetPasswordScreen()),
  //GetPage(name: Approutes.verifyemailsignup, page: () => const VerifyEmailSignupScreen()),
  // GetPage(name: Approutes.sucesssignup, page: () => const ScuccessSignUpScreen()),
  GetPage(name: Approutes.sucessressetpassword, page: () => const ScuccessRessetPasswordScreen()),
  GetPage(name: Approutes.homescreen, page: () => const HomeScreen()),
  // GetPage(name: Approutes.items, page: () => const ItemsScreen()),
  //GetPage(name: Approutes.itemsdetails, page: () => const ItemsDetailsScreen()),
  //GetPage(name: Approutes.favorite, page: () => const MyfavScreen()),
  //GetPage(name: Approutes.cart, page: () => const CartScreen()),
  //GetPage(name: Approutes.address, page: () => const AddressViewScreen()),
  // GetPage(name: Approutes.addNewAddress, page: () => const AddNewAddress()),
  //GetPage(name: Approutes.addressDetails, page: () => const AddressDetailsScreen()),
  //GetPage(name: Approutes.checkout, page: () => const PaymentMethodScreen()),
  GetPage(name: Approutes.pendings, page: () => PendingsScreen()),
  //GetPage(name: Approutes.notifications, page: () => NotificationScreen()),
  GetPage(name: Approutes.orderdetails, page: () => OrderDetailsScreen()),
  GetPage(name: Approutes.archive, page: () => ArchiveScreen()),
  GetPage(name: Approutes.ordertracking, page: () => OrderTrackingScreen()),
  //GetPage(name: "/", page: () => const PaymentMethodScreen()),
];
