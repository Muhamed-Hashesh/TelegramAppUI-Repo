import 'package:flutter/material.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';

class Sections extends StatelessWidget {
  const Sections(
      {super.key, required this.listLength, required this.listOfContent});
  final int listLength;
  final List listOfContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: List.generate(
          listLength,
          (index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            // height: 60,
            color: settingsItemColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: listOfContent[index]['color'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          listOfContent[index]['icon'],
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      listOfContent[index]['text'],
                      style: const TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios,
                    color: white.withOpacity(0.2), size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
