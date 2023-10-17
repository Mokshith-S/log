import 'package:flutter/material.dart';
import 'package:log/login_design/login_design.dart';
import 'package:log/main_page.dart';
import 'package:log/model/login_model.dart';
import 'package:log/users/users_data.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? displayScreen;

  void changePage(String text, String passCode) {
    String name = idGenerator.v5(Uuid.NAMESPACE_URL, text);

    if (usersData.containsKey(name)) {
      if (usersData[name]!.validate(text, passCode)) {
        setState(() {
          displayScreen = MainPage(
            username: text,
            logout: logout,
          );
        });
        return;
      }
    }
    showDialog(
      context: context,
      builder: (ctx) => const AlertDialog(
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 210, 106, 80),
        title: Text('Username or Password is not correct'),
      ),
    );
  }

  void logout() {
    setState(() {
      displayScreen = LoginForm(
        validating: changePage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    displayScreen = displayScreen ??
        LoginForm(
          validating: changePage,
        );
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: displayScreen,
    );
  }
}
