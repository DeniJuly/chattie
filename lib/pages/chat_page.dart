import 'package:chattie/config/theme.dart';
import 'package:chattie/widget/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left,
            color: blackColor,
            size: 35,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network('https://source.unsplash.com/100x100'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deni Juli Setiawan',
                  style: blackColorStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@denijsa',
                  style: grey3ColorStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          horizontal: DEFAULT_MARGIN,
          vertical: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ketik pesan...',
                    hintStyle: grey3ColorStyle,
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.send_rounded,
                color: whiteColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget chatList() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DEFAULT_MARGIN,
          ),
          child: ListView(
            children: [
              ChatItem(true),
              ChatItem(false),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              chatList(),
              chatInput(),
            ],
          ),
        ),
      ),
    );
  }
}
