import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';
import 'package:telegram_clone_app/views/messages_screen.dart';
import 'package:telegram_clone_app/widgets/custom_app_bar.dart';
import 'package:telegram_clone_app/widgets/custom_search_bar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          leadingOnPressed: null,
          titel: 'Chats',
          leading: Text(
            'Edit',
            style: TextStyle(
                color: primary, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          actionIcon: Icon(LineIcons.edit, color: primary),
        ),
      ),
      body: getChatScreenBody(),
    );
  }

  Widget getChatScreenBody() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
      child: Column(
        children: [
          const CustomSearchBar(
            searchText: 'Search for messages or users',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Column(
                  children: List.generate(
                    chatData.length,
                    (index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessagesScreen(
                              name: chatData[index]['name'],
                              image: chatData[index]['img'],
                              lastSeen: chatData[index]['date'],
                            ),
                          )),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(chatData[index]['img']),
                                radius: 36,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 300),
                                            child: Text(
                                              chatData[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  color: white,
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            chatData[index]['date'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: white.withOpacity(0.5),
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 250),
                                            child: Text(
                                              chatData[index]['text'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: white.withOpacity(0.5),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          chatData[index]['badge'] > 0
                                              ? badge.Badge(
                                                  badgeStyle:
                                                      const badge.BadgeStyle(
                                                          badgeColor: primary),
                                                  badgeContent: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: Text(
                                                      chatData[index]['badge']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: white),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Divider(
                                        color: white.withOpacity(0.15),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
