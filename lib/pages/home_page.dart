import 'package:chattie/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            width: 15,
            height: 15,
          ),
        ),
        title: Text(
          'Pesan',
          style: blackColorStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/dark.png',
            width: 45,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: header(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
