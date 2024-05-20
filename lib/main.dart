import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telegram_copy/firebase_options.dart';
import 'package:telegram_copy/auth/auth_gate_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Copy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(81, 125, 162, 1)),
        useMaterial3: true,
      ),
      home: const AuthGateScreen(),
    );
  }
}
