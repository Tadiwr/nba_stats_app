import 'package:flutter/material.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput({super.key, required this.onInput});

  final Function(String) onInput;

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:1,
      child: TextField(
        maxLength: 20,
        onChanged: (value) {widget.onInput(value);},
        decoration: const InputDecoration(
          hintText: "Enter your username",
        ),
        style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.normal,
          fontFamily: "Roboto"
        ),
      ),
    );
  }
}