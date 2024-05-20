import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:telegram_copy/auth/auth_service.dart";
import "package:telegram_copy/components/register_text_field.dart";
import "package:telegram_copy/data/user_register_data.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const RegisterScreen(),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    nicknameController.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  controller: nameController,
                  labelText: "Имя",
                ),
                const SizedBox(
                  height: 10,
                ),
                RegisterTextField(
                  controller: surnameController,
                  labelText: "Фамилия",
                ),
                const SizedBox(
                  height: 10,
                ),
                RegisterTextField(
                  controller: nicknameController,
                  labelText: "Никнейм",
                ),
                const SizedBox(
                  height: 10,
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
                  onPressed: () async {
                    AuthService authService = AuthService();

                    try {
                      await authService.register(
                          UserRegisterData(
                              emailController.text,
                              nameController.text,
                              surnameController.text,
                              "@${nicknameController.text}"),
                          passwordController.text);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => Text(e.toString()),
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF50A8EB)),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(360, 48)),
                      maximumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width * 0.9, 48))),
                  child: Text("Зарегистрироваться",
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
                        text: "Уже есть аккаунт? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        style: const TextStyle(color: Color(0xFF50A8EB)),
                        text: "Войти",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).pop(),
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
