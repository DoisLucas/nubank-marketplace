import 'package:flutter/material.dart';

import '../theme.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String? baloonText;

  const CircleButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.baloonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: NuTheme.kGrayLowColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                baloonText != null
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(25 / 2),
                          ),
                          child: Center(
                            child: Text(
                              baloonText ?? '',
                              style: TextStyle(
                                fontFamily: 'Graphik',
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Graphik',
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
