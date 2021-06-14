import 'package:flutter/material.dart';

import '../theme.dart';

class SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 2,
        color: NuTheme.kGrayLowColor,
      ),
    );
  }
}
