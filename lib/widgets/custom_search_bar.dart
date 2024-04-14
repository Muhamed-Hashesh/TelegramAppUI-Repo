import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.searchText});
  final String? searchText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: greyColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: TextField(
            style: const TextStyle(color: white),
            cursorColor: primary,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(LineIcons.search),
              hintText: searchText ?? 'Search',
              hintStyle: TextStyle(color: white.withOpacity(0.3), fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
