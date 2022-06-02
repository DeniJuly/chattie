import 'package:chattie/config/theme.dart';
import 'package:chattie/widget/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: whiteColor,
      ),
    );
    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: whiteColor,
        leading: Container(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/images/logo.png',
            width: 15,
            height: 15,
          ),
        ),
        title: Text(
          'Pesan',
          style: blackColorStyle.copyWith(
            fontSize: 22,
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

    Widget content() {
      return ListView(
        children: [
          ChatCard(),
          ChatCard(),
        ],
      );
    }

    Future<void> showChatModal() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (DEFAULT_MARGIN * 2),
          child: AlertDialog(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/popup-logo.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Masukkan username teman Anda',
                    style: blackColorStyle.copyWith(
                      fontSize: 20,
                      fontWeight: extraBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: whiteColor,
                      border: Border.all(
                        color: grey2Color,
                      ),
                    ),
                    child: Center(
                      child: Expanded(
                        child: TextFormField(
                          style: blackColorStyle,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Masukkan username',
                            hintStyle: grey2ColorStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Kirim',
                        style: whiteColorStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteColor,
      body: content(),
      floatingActionButton: FloatingActionButton(
        onPressed: showChatModal,
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
    );
  }
}
