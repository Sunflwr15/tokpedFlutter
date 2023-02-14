import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VerificationController extends GetxController {
  //TODO: Implement VerificationController

  final count = 0.obs;
  final Uri _url = Uri.parse('https://mail.google.com/mail/u/0/#inbox');

  @override

  // openMail() async {
  // await LaunchApp.openApp(
  //     androidPackageName: 'com.google.android.gm',
  //     iosUrlScheme: ' googlegmail://',
  //     appStoreLink:
  //         'itms-apps://apps.apple.com/us/app/gmail-email-by-google/id422689480',
  //     openStore: true);
  // }

  Future<void> openMail() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
