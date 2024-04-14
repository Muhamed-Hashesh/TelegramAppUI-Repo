import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';

class TextEntryBar extends StatelessWidget {
  const TextEntryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 80,
      width: double.infinity,
      color: greyColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Entypo.attachment,
              color: primary,
            ),
            Container(
              width: (MediaQuery.sizeOf(context).width) * 0.75,
              height: 40,
              decoration: BoxDecoration(
                color: white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Ionicons.ios_camera_outline,
                          color: primary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              MaterialCommunityIcons.microphone,
              color: primary,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
