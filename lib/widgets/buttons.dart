import 'package:flutter/material.dart';
import 'package:nba_stats_app/styles/text_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        
      ),
      child: Text(text, style: buttonText),
      
    );
  }
}