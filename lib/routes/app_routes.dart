import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_mart/features/authentication/screens/signup/signup.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:e_mart/features/personalization/screens/address/address.dart';
import 'package:e_mart/features/personalization/screens/profile/profile.dart';
import 'package:e_mart/features/personalization/screens/settings/settings.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/checkout/checkout.dart';
import 'package:e_mart/features/shop/screens/home/home.dart';
import 'package:e_mart/features/shop/screens/order/order.dart';
import 'package:e_mart/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_mart/features/shop/screens/store/store.dart';
import 'package:e_mart/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_mart/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: PRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: PRoutes.store, page: ()=> const StoreScreen()),
    GetPage(name: PRoutes.favourites, page: ()=> const FavouriteScreen()),
    GetPage(name: PRoutes.settings, page: ()=> const SettingsScreen()),
    GetPage(name: PRoutes.productReviews, page: ()=> const ProductReviewsScreen()),
    GetPage(name: PRoutes.order, page: ()=> const OrderScreen()),
    GetPage(name: PRoutes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: PRoutes.cart, page: ()=> const CartScreen()),
    GetPage(name: PRoutes.userProfile, page: ()=> const ProfileScreen()),
    GetPage(name: PRoutes.userAddress, page: ()=> const UserAddressScreen()),
    GetPage(name: PRoutes.signup, page: ()=> const SignupScreen()),
    GetPage(name: PRoutes.verifyEmail, page: ()=> const VerifyEmailScreen()),
    GetPage(name: PRoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: PRoutes.forgetPassword, page: ()=> const ForgetPassword()),
    GetPage(name: PRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
