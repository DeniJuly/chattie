import 'package:chattie/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 300,
              ),
              Text(
                'Chattie',
                style: primaryColorStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
