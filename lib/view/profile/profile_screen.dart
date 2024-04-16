import 'package:cordovatask/controller/profile_contoller/profile_controller.dart';
import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/model/user_model/user_model.dart';
import 'package:cordovatask/view/edit/edit_screen.dart';
import 'package:cordovatask/view/profile/widget/widget.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:cordovatask/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.userId});

  final getProfilrCtr = Get.put(ProfileController());
  final int userId;

  @override
  Widget build(BuildContext context) {
    getProfilrCtr.getUserDetails(userId);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
          height: 700,
          child: GetBuilder<ProfileController>(
            builder: (controller) {
              if (controller.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.isError == true) {
                return Center(
                  child: textWidget(text: 'Error occur', size: mediumFont),
                );
              } else {
                return Stack(children: [
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: const Color(0xff304FFF),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const CircleAvatar(
                                  radius: 22,
                                  backgroundColor: kwhite,
                                  child: CircleAvatar(
                                      radius: 21,
                                      backgroundColor: kViolet,
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: kwhite,
                                      )),
                                ),
                              ),
                              kWidth10,
                              textWidget(text: "Back", color: kwhite)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textWidget(
                                  text: controller.userName,
                                  size: veryLargeFont,
                                  weight: FontWeight.w500),
                              kHeight20,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: kCustomGrey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      DataTileWidget(
                                        firstHead: "Email",
                                        secondHead: controller.userEmail,
                                        iconData:
                                            Icons.local_post_office_outlined,
                                      ),
                                      kHeight30,
                                      DataTileWidget(
                                        firstHead: "Gender",
                                        secondHead: controller.userGender,
                                        iconData: Icons.female,
                                      ),
                                      kHeight30,
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              radius: 26,
                                              backgroundColor: kCustomGrey,
                                              child: textWidget(
                                                  text: "!",
                                                  size: veryLargeFont,
                                                  color: kViolet)),
                                          kWidth10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              textWidget(
                                                  text: "Status",
                                                  size: mediumFont,
                                                  weight: FontWeight.w500),
                                              kHeight10,
                                              textWidget(
                                                text: controller.userStatus,
                                                size: mediumFont,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      top: 90,
                      left: 20,
                      right: 20,
                      child: Card(
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: kwhite,
                          radius: 50,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(
                                controller.userGender == "female"
                                    ? 'assets/image1.png'
                                    : 'assets/image2.png'),
                          ),
                        ),
                      ))
                ]);
              }
            },
          ),
        )),
        bottomNavigationBar: BottomButton(
          text: 'Edit Details',
          function: () {
            Get.off(EditScreen(
              userData: UserModel(
                  name: getProfilrCtr.userName,
                  email: getProfilrCtr.userEmail,
                  gender: getProfilrCtr.userGender,
                  status: getProfilrCtr.userStatus,
                  id: userId),
            ));
          },
        ),
      ),
    );
  }
}
