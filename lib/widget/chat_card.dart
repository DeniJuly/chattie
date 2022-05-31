import 'package:chattie/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: DEFAULT_MARGIN,
        vertical: 5.0,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://source.unsplash.com/100x100',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deni Juli Setiawan',
                  style: blackColorStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Reference site about Lorem Ipsum, giving something good for me yes for me buddy',
                  style: grey3ColorStyle.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '10:20',
                style: grey3ColorStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: whiteColorStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
