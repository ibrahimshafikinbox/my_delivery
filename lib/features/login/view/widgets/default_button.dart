import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;
  final Color bottonColor;

  const DefaultButton({
    Key? key,
    this.height = 50,
    required this.function,
    required this.text,
    this.isUpperCase = false,
    this.radius = 20.0,
    required this.textColor,
    required this.bottonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: bottonColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: function,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
