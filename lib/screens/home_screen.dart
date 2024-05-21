import 'package:flutter/material.dart';
import 'package:telegram_copy/auth/auth_service.dart';
import 'package:telegram_copy/chat/chat_service.dart';
import 'package:telegram_copy/components/chat_tile.dart';
import 'package:telegram_copy/data/user_data/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  bool isDrawerOpened = false;

  @override
  Widget build(BuildContext context) {
    ChatService chatService = ChatService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(81, 125, 162, 1),
        title: Text(widget.title),
      ),
      onDrawerChanged: (value) {
        setState(() {
          isDrawerOpened = value;
        });
      },
      body: StreamBuilder(
        stream: chatService.watchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map((e) => ChatTile(userData: UserData.fromJson(e)))
                .toList(),
          );
        },
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: TextButton(
            onPressed: () async {
              AuthService authService = AuthService();
              await authService.logout();
            },
            child: const Text("Разлогинься!!")),
      ),
    );
  }
}
