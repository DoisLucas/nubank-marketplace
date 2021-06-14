import 'package:flutter/material.dart';

import '../commons.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double? width;
  final double? heigth;
  final double? fontSize;

  const MainButton({
    Key? key,
    this.width,
    this.heigth,
    this.fontSize,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigth ?? 40,
        width: width,
        decoration: BoxDecoration(
          color: NuTheme.kMainColor,
          borderRadius: BorderRadius.circular(heigth ?? 40),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
