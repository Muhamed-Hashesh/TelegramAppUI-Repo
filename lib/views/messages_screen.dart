import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:telegram_clone_app/json/chat_json.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';
import 'package:telegram_clone_app/widgets/chat_bubble.dart';
import 'package:telegram_clone_app/widgets/custom_app_bar.dart';
import 'package:telegram_clone_app/widgets/text_entry_bar.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.lastSeen});
  final String name;
  final String image;
  final String lastSeen;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            hasDescription: true,
            description: Text(
              'Last seen ${widget.lastSeen}',
              style: TextStyle(color: white.withOpacity(0.5), fontSize: 16),
            ),
            leadingOnPressed: () => Navigator.pop(context),
            titel: widget.name,
            leading: const Icon(
              Ionicons.ios_chevron_back_sharp,
              color: primary,
              size: 32,
            ),
            actionIcon:
                CircleAvatar(backgroundImage: NetworkImage(widget.image))),
      ),
      bottomNavigationBar: const TextEntryBar(),
      body: getMessagesBody(),
    );
  }

  Widget getMessagesBody() {
    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      children: List.generate(
        messages.length,
        (index) => CustomBubbleChat(
          isMe: messages[index]['isMe'],
          message: messages[index]['message'],
          time: messages[index]['time'],
          isLast: messages[index]['isLast'],
        ),
      ),
    );
  }
}
