import 'package:chattie/app/controllers/auth_controller.dart';
import 'package:chattie/pages/chat_page.dart';
import 'package:chattie/pages/home_page.dart';
import 'package:chattie/pages/login_page.dart';
import 'package:chattie/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute:
                  authController.isAuthenticated.isTrue ? '/' : '/login',
              getPages: [
                GetPage(
                  name: '/login',
                  page: () => const LoginPage(),
                ),
                GetPage(
                  name: '/',
                  page: () => const HomePage(),
                ),
                GetPage(
                  name: '/chat',
                  page: () => const ChatPage(),
                ),
              ],
            ),
          );
        }
        return const SplashPage();
      },
    );
  }
}
