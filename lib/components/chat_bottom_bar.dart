import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telegram_copy/chat/chat_service.dart';
import 'package:telegram_copy/components/register_text_field.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({super.key, required this.receiverId});

  final String receiverId;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      children: [
        Expanded(
          child: RegisterTextField(controller: messageController),
        ),
        IconButton(
            onPressed: () async {
              ChatService chatService = ChatService();
              await chatService.sendMessage(
                  widget.receiverId, messageController.text);
              messageController.clear();
            },
            icon: Icon(Icons.send))
      ],
    ));
  }
}
