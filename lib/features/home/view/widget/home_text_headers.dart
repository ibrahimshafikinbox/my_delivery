import 'package:flutter/material.dart';

import 'package:my_store/core/resources/styles/app_text_style.dart';

class HomeTextHeaders extends StatelessWidget {
  final String text;
  const HomeTextHeaders({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppTextStyle.textStyleBoldBlack.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ));
  }
}
