import 'package:get/get.dart';

import '../modules/DetailScreen/bindings/detail_screen_binding.dart';
import '../modules/DetailScreen/views/detail_screen_view.dart';
import '../modules/createProduct/bindings/create_product_binding.dart';
import '../modules/createProduct/views/create_product_view.dart';
import '../modules/createSlider/bindings/create_slider_binding.dart';
import '../modules/createSlider/views/create_slider_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeAdmin/bindings/home_admin_binding.dart';
import '../modules/homeAdmin/views/home_admin_view.dart';
import '../modules/loginScreen/bindings/login_screen_binding.dart';
import '../modules/loginScreen/views/login_screen_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/phoneScreen/bindings/phone_screen_binding.dart';
import '../modules/phoneScreen/views/phone_screen_view.dart';
import '../modules/productData/bindings/product_data_binding.dart';
import '../modules/productData/views/product_data_view.dart';
import '../modules/registerScreen/bindings/register_screen_binding.dart';
import '../modules/registerScreen/views/register_screen_view.dart';
import '../modules/sliderData/bindings/slider_data_binding.dart';
import '../modules/sliderData/views/slider_data_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/updateProduct/bindings/update_product_binding.dart';
import '../modules/updateProduct/views/update_product_view.dart';
import '../modules/updateSlider/bindings/update_slider_binding.dart';
import '../modules/updateSlider/views/update_slider_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => const RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SCREEN,
      page: () => const DetailScreenView(),
      binding: DetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_SCREEN,
      page: () => const PhoneScreenView(),
      binding: PhoneScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => const HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_SLIDER,
      page: () => UpdateSliderView(),
      binding: UpdateSliderBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DATA,
      page: () => ProductDataView(),
      binding: ProductDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT,
      page: () => const CreateProductView(),
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PRODUCT,
      page: () => const UpdateProductView(),
      binding: UpdateProductBinding(),
    ),
  ];
}
