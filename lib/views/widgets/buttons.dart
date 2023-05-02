import 'package:flutter/material.dart';
import 'package:nba_stats_app/styles/text_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        onPressed()
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        
      ),
      child: Text(text, style: buttonText),
      
    );
  }
}