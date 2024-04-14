import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';
import 'package:telegram_clone_app/views/chats_page.dart';
import 'package:telegram_clone_app/views/contacts_page.dart';
import 'package:telegram_clone_app/views/settings_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getNavBar(),
      body: getndexedBody(),
    );
  }

  Widget getNavBar() {
    List<Map> navBarItems = [
      {
        'icon': MaterialIcons.account_circle,
        'label': 'Contacts',
      },
      {
        'icon': Ionicons.ios_chatbubbles,
        'label': 'Chats',
      },
      {
        'icon': MaterialIcons.settings,
        'label': 'Settings',
      },
    ];

    return Container(
      height: 90,
      width: double.infinity,
      color: greyColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            navBarItems.length,
            (index) => GestureDetector(
              onTap: () => setState(() => currentIndex = index),
              child: Column(
                children: [
                  index == 1
                      ? badge.Badge(
                          badgeContent: const Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: Icon(
                            navBarItems[index]['icon'],
                            size: 30,
                            color: currentIndex == index
                                ? primary
                                : Colors.white.withOpacity(0.5),
                          ),
                        )
                      : Icon(
                          navBarItems[index]['icon'],
                          size: 30,
                          color: currentIndex == index
                              ? primary
                              : Colors.white.withOpacity(0.5),
                        ),
                  const SizedBox(height: 3),
                  Text(
                    navBarItems[index]['label'],
                    style: TextStyle(
                      fontSize: 13,
                      color: currentIndex == index
                          ? primary
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getndexedBody() {
    return IndexedStack(
      index: currentIndex,
      children: const [
        ContactsScreen(),
        ChatsScreen(),
        SettingsScreen(),
      ],
    );
  }
}
