import 'package:flutter/material.dart';
import 'package:telegram_copy/data/user_data/user_data.dart';
import 'package:telegram_copy/screens/chat_screen.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${userData.name} ${userData.surname}"),
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(userData.uid));
      },
    );
  }
}
