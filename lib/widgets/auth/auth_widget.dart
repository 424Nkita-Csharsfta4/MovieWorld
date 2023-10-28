import 'package:flutter/material.dart';
import 'dart:async';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войдите в свой аккаунт'),
        backgroundColor: const Color.fromARGB(255, 16, 16, 20),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HeaderWidget(),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        const FormWidget(),
        const SizedBox(height: 25),
        const Text(
          'Чтобы получить доступ к функциям редактирования и выставления оценок КиноМагия и получить персональные рекомендации, пожалуйста, войдите в свою учетную запись. Если у вас нет учетной записи, регистрация бесплатна и проста.',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        const Text(
          "Если вы зарегистрировались, но не получили подтверждение по электронной почте,",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            // Add a handler to navigate to the confirmation link
          },
          child: const Text(
            'нажмите здесь',
            style: TextStyle(
              color: Colors.teal,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? errorText;

  void auth(BuildContext context) {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isNotEmpty && password.isNotEmpty) {
      if (login == 'admin' && password == 'admin') {
        errorText = null;
        Navigator.of(context).pushReplacementNamed('/main_screen');
      } else {
        errorText = 'Неверное имя пользователя или пароль';
      }
    } else {
      errorText = 'Вы ввели неверные данные';
      // Display the error for 2 seconds and then clear it
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorText!),
        ),
      );
      Timer(const Duration(seconds: 2), () {
        setState(() {
          errorText = null;
        });
      });
    }
    setState(() {});
  }

  void resetPassword() {
    print('Сбросить пароль!');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Почта',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: loginTextController,
          decoration: InputDecoration(
            hintText: 'Почта',
            errorText: errorText,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Пароль',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: passwordTextController,
          decoration: InputDecoration(
            hintText: 'Пароль',
            errorText: errorText,
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 10, 10, 10),
              ),
              onPressed: () {
                auth(context);
              },
              child: const Text('Вход'),
            ),
            TextButton(
              onPressed: () {
                resetPassword();
              },
              child: const Text(
                'Сброс пароля',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
