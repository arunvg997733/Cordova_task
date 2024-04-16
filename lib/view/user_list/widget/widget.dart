import 'package:cordovatask/controller/home_controller/home_controller.dart';
import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/constant_function.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/model/user_model/user_model.dart';
import 'package:cordovatask/view/edit/edit_screen.dart';
import 'package:cordovatask/view/profile/profile_screen.dart';
import 'package:cordovatask/view/widget/icon_widget/icon_widget.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    this.function,
  });

  final String text;
  final IconData icon;
  final Color iconColor;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: kwhite,
            border: Border.all(color: kGrey),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5, horizontal: size.width * 10 / 428),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconWidget(
                  icon: icon,
                  color: iconColor,
                  size: size.width * smallFont / 428),
              SizedBox(
                width: size.width * 5 / 428,
              ),
              textWidget(text: text, size: size.width * smallFont / 428)
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.userData,
    required this.getHomeCtr,
  });
  final HomeController getHomeCtr;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(userData.gender == 'female'
                      ? 'assets/image1.png'
                      : 'assets/image2.png'),
                ),
              ),
              kWidth20,
              Expanded(
                child: textWidget(
                    text: userData.name ?? "",
                    size: size.width * largeFont / 428,
                    weight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
              ),
              kWidth20,
              Row(
                children: [
                  ButtonWidget(
                    function: () {
                      Get.to(() => EditScreen(
                            userData: userData,
                          ));
                    },
                    text: "Edit",
                    icon: Icons.mode_edit_outline_outlined,
                    iconColor: kViolet,
                  ),
                  SizedBox(
                    width: size.width * 10 / 428,
                  ),
                  ButtonWidget(
                    function: () {
                      Get.to(() => ProfileScreen(
                            userId: userData.id!,
                          ));
                    },
                    text: "View",
                    icon: Icons.remove_red_eye_outlined,
                    iconColor: kViolet,
                  ),
                  SizedBox(
                    width: size.width * 10 / 428,
                  ),
                  ButtonWidget(
                    function: () {
                      showDialogWidget(
                          context: context,
                          title: 'Are you sure to Delete',
                          function: () {
                            getHomeCtr.delete(userData.id!);
                          });
                    },
                    text: "Delete",
                    icon: Icons.delete_outlined,
                    iconColor: kRed,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
