import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/screens/home/users/users.dart';
import 'package:chat_app/utils/navigation/custom_navigation.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Chat app",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp"),
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          CustomNavigation.nextPage(
                              context, const ChatScreen());
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
                              "This is new message",
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                            leading: const CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  "https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp"),
                            ),
                            trailing: const Text("18:55"),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomNavigation.nextPage(context, const UsersScreen());
        },
        child: const Icon(Icons.people),
      ),
    );
  }
}