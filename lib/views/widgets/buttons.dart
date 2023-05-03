import 'package:flutter/material.dart';
import 'package:nba_stats_app/styles/text_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 64, 188, 68),
    this.foregroundColor = Colors.black
  });

  final String text;
  final Function onPressed;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => {
            onPressed()
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            
          ),
          child: Text(text, style: buttonText),
          
        ),
      ),
    );
  }
}