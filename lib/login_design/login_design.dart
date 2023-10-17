import 'package:flutter/material.dart';
import 'package:log/login_design/textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.validating});

  final void Function(String text, String passCode) validating;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userInput = TextEditingController();
  final passInput = TextEditingController();

  @override
  void dispose() {
    userInput.dispose();
    passInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldBox(
              labelData: 'Username',
              inputController: userInput,
              visibility: false,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldBox(
              labelData: 'Password',
              inputController: passInput,
              visibility: true,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                widget.validating(userInput.text, passInput.text);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
              ),
            )
          ],
        ),
      ),
    );
  }
}
