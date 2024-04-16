import 'package:cordovatask/controller/edit_controller/edit_controller.dart';
import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/constant_function.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/model/user_model/user_model.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:cordovatask/view/widget/textform/textform.dart';
import 'package:cordovatask/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key, required this.userData});

  final getEditCtr = Get.put(EditController());

  final UserModel userData;
  @override
  Widget build(BuildContext context) {
    getEditCtr.nameCtr.text = userData.name!;
    getEditCtr.emailCtr.text = userData.email!;
    getEditCtr.genderCtr.text = userData.gender!;
    getEditCtr.statusCtr.text = userData.status!;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: Stack(children: [
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
                      child: Form(
                        key: getEditCtr.fkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget(
                                text: 'Name',
                                size: mediumFont,
                                weight: FontWeight.w500),
                            kHeight10,
                            CustomTextFormField(
                              validator: checkFieldEmpty,
                              size: double.infinity,
                              hint: 'Name',
                              controller: getEditCtr.nameCtr,
                            ),
                            kHeight10,
                            textWidget(
                                text: 'Email',
                                size: mediumFont,
                                weight: FontWeight.w500),
                            kHeight10,
                            CustomTextFormField(
                              validator: checkFieldEmailIsValid,
                              size: double.infinity,
                              hint: 'Email',
                              controller: getEditCtr.emailCtr,
                            ),
                            kHeight10,
                            textWidget(
                                text: 'Gender',
                                size: mediumFont,
                                weight: FontWeight.w500),
                            kHeight10,
                            CustomTextFormField(
                              validator: checkFieldEmpty,
                              size: double.infinity,
                              hint: 'Gender',
                              controller: getEditCtr.genderCtr,
                            ),
                            kHeight10,
                            textWidget(
                                text: 'Status',
                                size: mediumFont,
                                weight: FontWeight.w500),
                            kHeight10,
                            CustomTextFormField(
                              validator: checkFieldEmpty,
                              size: double.infinity,
                              hint: 'Status',
                              controller: getEditCtr.statusCtr,
                            ),
                            kHeight10,
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Positioned(
                top: 115,
                left: 20,
                right: 20,
                child: StackContainerWidget(
                  firstHeadText: "Edit Details",
                  iconData: Icons.edit_outlined,
                  secondHead: false,
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: BottomButton(
          function: () {
            if (getEditCtr.fkey.currentState?.validate() ?? false) {
              getEditCtr.updateUserData(userData.id!);
            }
          },
          text: 'Update Details',
        ),
      ),
    );
  }
}
