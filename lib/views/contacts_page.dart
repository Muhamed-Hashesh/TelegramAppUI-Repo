import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone_app/json/contact_json.dart';
import 'package:telegram_clone_app/theme/constants/colors.dart';
import 'package:telegram_clone_app/widgets/custom_app_bar.dart';
import 'package:telegram_clone_app/widgets/custom_search_bar.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => ContactsScreenState();
}

class ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          leadingOnPressed: () {
            sortListFunction();
          },
          titel: 'Contacts',
          leading: const Text(
            'Sort',
            style: TextStyle(
                color: primary, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          actionIcon: const Icon(LineIcons.plus, color: primary),
        ),
      ),
      body: getContactsScreenBody(),
    );
  }

  Widget getContactsScreenBody() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
      child: Column(
        children: [
          const CustomSearchBar(),
          const SizedBox(height: 10),
          getSearchFriendsSection(),
          getYourContactsList(),
        ],
      ),
    );
  }

  Widget getSearchFriendsSection() {
    List contactsIconsList = [
      {
        "icon": LineIcons.mapMarker,
        "label": "Find Nearby People",
      },
      {
        "icon": LineIcons.userPlus,
        "label": "Invite Friends",
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: List.generate(
          contactsIconsList.length,
          (index) => Column(
            children: [
              Row(
                children: [
                  Icon(
                    contactsIconsList[index]['icon'],
                    color: primary,
                    size: 28,
                  ),
                  const SizedBox(width: 24),
                  Text(
                    contactsIconsList[index]['label'],
                    style: const TextStyle(
                      color: primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget getYourContactsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Divider(
              thickness: 0.5,
              color: white.withOpacity(0.3),
            ),
          ),
          Column(
            children: List.generate(
              contactData.length,
              (index) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(contactData[index]['img']),
                        radius: 26,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contactData[index]['name'],
                            style: const TextStyle(color: white, fontSize: 18),
                          ),
                          Text(
                            contactData[index]['is_online']
                                ? 'online'
                                : contactData[index]['seen'],
                            style: TextStyle(
                                color: contactData[index]['is_online']
                                    ? primary
                                    : white.withOpacity(0.5),
                                fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Divider(
                      thickness: 1,
                      color: white.withOpacity(0.15),
                    ),
                  ),
                  // const SizedBox(height: 16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void sortListFunction() {
    setState(() {
      List<Map<String, dynamic>> mutableContactData = List.from(contactData);

      mutableContactData.sort((a, b) => a['name'].compareTo(b['name']));

      contactData = mutableContactData;
    });
  }
}
