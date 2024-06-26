import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:line_icons/line_icons.dart';

List settingSectionOne = [
  {"icon": Icons.bookmark, "text": "Saved Messages", "color": Colors.blue[700]},
  {"icon": FontAwesome.phone, "text": "Recent Calls", "color": Colors.green},
  {
    "icon": MaterialIcons.devices,
    "text": "Devices",
    "color": const Color(0xFFFCAA26)
  },
  {"icon": Icons.folder, "text": "Chat Folders", "color": Colors.cyan},
];

List settingSectionTwo = [
  {
    "icon": Icons.notifications,
    "text": "Notifications and Sounds",
    "color": Colors.redAccent
  },
  {"icon": Icons.lock, "text": "Privacy and Security", "color": Colors.grey},
  {
    "icon": LineIcons.database,
    "text": "Data and Storage",
    "color": Colors.green
  },
  {"icon": Icons.dark_mode, "text": "Appearance", "color": Colors.cyan},
  {"icon": Icons.language, "text": "Language", "color": Colors.purple},
  {
    "icon": Icons.sticky_note_2,
    "text": "Stickers and Emoji",
    "color": Colors.yellow[800]
  },
];

List settingSectionThree = [
  {"icon": Icons.chat, "text": "Ask a Question", "color": Colors.yellow[800]},
  {"icon": Icons.info, "text": "Telegram FAQ", "color": Colors.cyan},
  {
    "icon": MaterialIcons.lightbulb_outline,
    "text": "Telegram Features",
    "color": const Color(0xFFFCAA26)
  },
];
