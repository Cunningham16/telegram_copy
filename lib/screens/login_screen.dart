import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:telegram_copy/screens/register_screen.dart";

import "../components/register_text_field.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/images/telegram_logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Добро пожаловать!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                RegisterTextField(
                  controller: emailController,
                  labelText: "Адрес электронной почты",
                ),
                const SizedBox(
                  height: 10,
                ),
                RegisterTextField(
                  controller: passwordController,
                  obscureText: true,
                  labelText: "Пароль",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF50A8EB)),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(360, 48)),
                      maximumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width * 0.9, 48))),
                  child: Text("Войти",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: "Нет аккаунта? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        style: const TextStyle(color: Color(0xFF50A8EB)),
                        text: "Зарегистрироваться",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .push(RegisterScreen.route()),
                      )
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
