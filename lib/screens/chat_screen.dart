import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegram_copy/chat/chat_service.dart';
import 'package:telegram_copy/components/chat_bottom_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});

  final String userId;

  static Route<void> route(String id) {
    return MaterialPageRoute(builder: (context) => ChatScreen(userId: id));
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: StreamBuilder(
          stream: ChatService().getMessages(
              FirebaseAuth.instance.currentUser!.uid, widget.userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: Text(snapshot.data!.docs.toString()));
          },
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ChatBottomBar(
            receiverId: widget.userId,
          ),
        ),
        resizeToAvoidBottomInset: true);
  }
}
