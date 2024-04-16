import 'package:cordovatask/controller/home_controller/home_controller.dart';
import 'package:cordovatask/core/constant.dart';
import 'package:cordovatask/core/font_size/font_size.dart';
import 'package:cordovatask/view/user_list/widget/widget.dart';
import 'package:cordovatask/view/widget/text_widget/text_widget.dart';
import 'package:cordovatask/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final getHomeCtr = Get.put(HomeController());
  final listController = ScrollController();

  @override
  void initState() {
    super.initState();
    getHomeCtr.getUserDataList();
    listController.addListener(() {
      if (listController.position.maxScrollExtent == listController.offset) {
        getHomeCtr.fetchMoreDataList();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    listController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          getHomeCtr.getUserDataList();
        },
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: const Color(0xff304FFF),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => textWidget(
                              text:
                                  "No of Users (${getHomeCtr.userList.length})"),
                        ),
                        kHeight20,
                        Expanded(
                          child: Obx(
                            () => getHomeCtr.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.separated(
                                    controller: listController,
                                    padding: EdgeInsetsGeometry.lerp(
                                        EdgeInsets.zero, EdgeInsets.zero, 0),
                                    itemBuilder: (context, index) {
                                      if (index < getHomeCtr.userList.length) {
                                        final userData =
                                            getHomeCtr.userList[index];
                                        return ListTileWidget(
                                          getHomeCtr: getHomeCtr,
                                          userData: userData,
                                        );
                                      } else {
                                        return Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 130,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: kCustomGrey),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                          height: mediumFont,
                                                          width: mediumFont,
                                                          child:
                                                              CircularProgressIndicator()),
                                                      kWidth10,
                                                      textWidget(
                                                          text: "Load More",
                                                          color: kViolet,
                                                          size: mediumFont)
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemCount: getHomeCtr.userList.length + 1,
                                  ),
                          ),
                        ),
                      ],
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
                firstHeadText: "Users List",
                iconData: Icons.person_outline_sharp,
                secondHead: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
