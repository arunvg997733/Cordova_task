import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/view/widget/icon_widget/icon_widget.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class DataTileWidget extends StatelessWidget {
  const DataTileWidget({
    super.key,
    required this.iconData,
    required this.firstHead,
    required this.secondHead,
  });
  final IconData iconData;
  final String firstHead;
  final String secondHead;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: kCustomGrey,
          child: iconWidget(icon: iconData, color: kViolet, size: 35),
        ),
        kWidth10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                  text: firstHead, size: mediumFont, weight: FontWeight.w500),
              kHeight10,
              textWidget(
                text: secondHead,
                size: mediumFont,
              )
            ],
          ),
        )
      ],
    );
  }
}
