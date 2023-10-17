import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox(
      {super.key,
      required this.labelData,
      required this.inputController,
      required this.visibility});

  final String labelData;
  final TextEditingController inputController;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      style: Theme.of(context).textTheme.titleMedium,
      obscureText: visibility,
      decoration: InputDecoration(
        labelText: labelData,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
