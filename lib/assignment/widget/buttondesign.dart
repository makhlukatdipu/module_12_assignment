import 'package:flutter/material.dart';
class buttondesign extends StatelessWidget {
  final String text;
  Color ? color;
  final VoidCallback onclick;
  TextStyle ? textStyle;

  buttondesign({
    super.key,  required this.onclick, required this.text, this.color,this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.white50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20)
          ),
          onPressed: onclick,
          child: Text(
            text,
            style: textStyle ?? TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}