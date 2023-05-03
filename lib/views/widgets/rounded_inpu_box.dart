import 'package:flutter/material.dart';

class RoundedInput extends StatefulWidget {
  const RoundedInput({super.key});

  @override
  State<RoundedInput> createState() => _RoundedInputState();
}

class _RoundedInputState extends State<RoundedInput> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex:1,
      child: TextField(
        maxLength: 20,
        decoration: InputDecoration(
          hintText: "Enter your username",
        ),
        style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ),
      ),
    );
  }
}