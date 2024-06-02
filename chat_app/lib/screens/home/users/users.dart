import 'package:flutter/material.dart';

import '../../../utils/navigation/custom_navigation.dart';
import '../../chat/chat_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              const BackButton(),
              Text(
                "Contacts",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      CustomNavigation.nextPage(context, const ChatScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        title: const Text(
                          "Kamal Bandara",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Online ",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              "https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp"),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
