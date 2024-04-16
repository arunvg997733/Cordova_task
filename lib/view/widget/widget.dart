import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/view/widget/icon_widget/icon_widget.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class StackContainerWidget extends StatelessWidget {
  const StackContainerWidget({
    super.key,
    required this.firstHeadText,
    required this.iconData,
    required this.secondHead,
  });

  final String firstHeadText;
  final IconData iconData;
  final bool secondHead;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 0),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: kwhite, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: kCustomGrey,
                child: iconWidget(icon: iconData, color: kViolet, size: 35),
              ),
              kWidth10,
              textWidget(
                  text: firstHeadText,
                  size: size.width * largeFont / 428,
                  weight: FontWeight.w500),
              const Spacer(),
              secondHead == true
                  ? Row(
                      children: [
                        iconWidget(
                            icon: Icons.refresh,
                            color: kViolet,
                            size: size.width * veryLargeFont / 428),
                        SizedBox(
                          width: size.width * 5 / 428,
                        ),
                        textWidget(
                            text: "Load User Data",
                            color: kViolet,
                            size: size.width * smallFont / 428)
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomButton extends StatelessWidget {
  BottomButton({super.key, required this.text, this.function});

  final String text;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: InkWell(
        onTap: function,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: kBlue),
          child: Center(
              child: textWidget(text: text, color: kwhite, size: mediumFont)),
        ),
      ),
    );
  }
}
