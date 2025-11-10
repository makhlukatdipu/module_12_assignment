import 'package:flutter/material.dart';

class buttondesign extends StatelessWidget {
  final String text;
  Color? color;
  final VoidCallback onclick;
  TextStyle? textStyle;

  buttondesign({
    super.key,
    required this.onclick,
    required this.text,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color bgColor = color ?? (isDarkMode ? Colors.grey : Colors.white50);
    final Color textColor =
        textStyle?.color ?? (isDarkMode ? Colors.black : Colors.black);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          onPressed: onclick,
          child: Text(
            text,
            style: TextStyle(
              color: textStyle?.color ?? textColor,
              fontSize: textStyle?.fontSize ?? 28,
              fontWeight: textStyle?.fontWeight ?? FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
