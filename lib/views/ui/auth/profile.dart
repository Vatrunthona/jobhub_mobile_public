import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/width_spacer.dart';

import '../../common/app_bar.dart';
import '../../common/drawer/drawerWidget.dart';
import '../../common/height_spacer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const CustomAppBar(
          text: 'Profile',
          child: DrawerWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: height * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          width: 80.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      const WidthSpacer(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: "John Doe",
                              style: appstyle(
                                  20, Color(kDark.value), FontWeight.w600)),
                          Row(
                            children: [
                              const Icon(MaterialIcons.location_pin),
                              const WidthSpacer(width: 5),
                              ReusableText(
                                  text: "Lagos, Nigeria",
                                  style: appstyle(16, Color(kDarkGrey.value),
                                      FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Feather.edit, size: 18),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 20),
            Stack(
              children: [
                Container(
                  color: Color(kLightGrey.value),
                  width: width,
                  height: height * 0.12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          width: 60,
                          height: 70,
                          color: Color(kLight.value),
                          child: const Icon(
                            FontAwesome5Regular.file_pdf,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                                text: "Resume from Job Hub",
                                style: appstyle(
                                    18, Color(kDark.value), FontWeight.w500)),
                            ReusableText(
                                text: "Job Hub Resume",
                                style: appstyle(16, Color(kDarkGrey.value),
                                    FontWeight.w500)),
                          ],
                        ),
                        const WidthSpacer(width: 1),
                      ]),
                ),
                Positioned(
                  top: 2.h,
                  right: 2.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: ReusableText(
                        text: "Edit",
                        style: appstyle(
                            16, Color(kOrange.value), FontWeight.w500)),
                  ),
                ),
              ],
            ),
            const HeightSpacer(height: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: height * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                    text: "andre@dbestech.com",
                    style: appstyle(16, Color(kDark.value), FontWeight.w600)),
              ),
            ),
            const HeightSpacer(height: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: height * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/usa.svg",
                            width: 20.w, height: 20.h),
                        const WidthSpacer(width: 10),
                        ReusableText(
                            text: "+1 1234567890",
                            style: appstyle(
                                16, Color(kDark.value), FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const HeightSpacer(height: 20),
            Container(
              color: Color(kLightGrey.value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: ReusableText(
                        text: "Skills",
                        style:
                            appstyle(16, Color(kDark.value), FontWeight.w600)),
                  ),
                  const HeightSpacer(height: 3),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: ListView.builder(
                      itemCount: skills.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final skill = skills[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: width,
                            height: height * 0.06,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            color: Color(kLight.value),
                            child: ReusableText(
                                text: skill,
                                style: appstyle(
                                    16, Color(kDark.value), FontWeight.normal)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 20),
          ],
        ),
      ),
    );
  }
}
