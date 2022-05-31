import 'package:chattie/config/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: DEFAULT_MARGIN,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ilustrasi-signup.png',
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Chattie',
                style: blackColorStyle.copyWith(
                  fontSize: 24,
                  fontWeight: extraBold,
                ),
              ),
              Text(
                'Chating dengan bestie terbaikmu hehe...',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: greyColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Masuk dengan google',
                      style: blackColorStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
