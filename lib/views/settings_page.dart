import 'package:flutter/material.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/json/setting_json.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';
import 'package:telegram_clone_app/widgets/custom_app_bar.dart';
import 'package:telegram_clone_app/widgets/sections.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          titel: '',
          leadingOnPressed: null,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              color: primary,
            ),
          ),
          actionIcon: const Text(
            'Edit',
            style: TextStyle(
                color: primary, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: getSettingsBody(),
    );
  }

  Widget getSettingsBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: Image.asset(
                  profile[0]['img'],
                  fit: BoxFit.cover,
                ).image,
                radius: 80,
              ),
            ),
          ),
          Text(
            profile[0]['name'],
            style: const TextStyle(
                color: white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            '${profile[0]['phone']} - ${profile[0]['id']}',
            style: TextStyle(color: white.withOpacity(0.5), fontSize: 16),
          ),
          const SizedBox(height: 30),
          Sections(
            listLength: settingSectionOne.length,
            listOfContent: settingSectionOne,
          ),
          Sections(
            listLength: settingSectionTwo.length,
            listOfContent: settingSectionTwo,
          ),
          Sections(
            listLength: settingSectionThree.length,
            listOfContent: settingSectionThree,
          ),
        ],
      ),
    );
  }
}
