import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:log/home_page.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 151, 50, 198),
          title: const Text("Login form"),
        ),
        body: const Home(),
      ),
    );
  }
}
