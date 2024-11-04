import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';

import '../../common/width_spacer.dart';

class JobPage extends StatefulWidget {
  final String title;
  final String id;

  const JobPage({super.key, required this.title, required this.id});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: widget.title,
          action: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(CupertinoIcons.bookmark_fill)),
            ),
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              ListView(padding: EdgeInsets.zero, children: [
                const HeightSpacer(height: 30),
                Container(
                  width: width,
                  height: height * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        // radius: 50.r,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                      const HeightSpacer(height: 10),
                      ReusableText(
                          text: "Senior Flutter Developer",
                          style: appstyle(
                              22, Color(kDark.value), FontWeight.w600)),
                      const HeightSpacer(height: 5),
                      ReusableText(
                          text: "Cambodia",
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.normal)),
                      const HeightSpacer(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              text: "Full-Time",
                              onTap: () {},
                              width: width * 0.26,
                              height: height * 0.04,
                              borderColor: Color(kOrange.value),
                              color: Color(kLight.value),
                              textColor: Color(kOrange.value),
                            ),
                            Row(
                              children: [
                                ReusableText(
                                    text: "10k",
                                    style: appstyle(22, Color(kDark.value),
                                        FontWeight.w600)),
                                SizedBox(
                                    width: width * 0.2,
                                    child: ReusableText(
                                        text: "/monthly",
                                        style: appstyle(
                                            22,
                                            Color(kDarkGrey.value),
                                            FontWeight.w600))),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightSpacer(height: 20),
                ReusableText(
                    text: "Job Description",
                    style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(height: 10),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.normal),
                ),
                const HeightSpacer(height: 20),
                ReusableText(
                    text: "Job Requirement",
                    style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(height: 10),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                    itemCount: requirements.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = requirements[index];
                      String bullet = "\u2022";
                      return Text(
                        "$bullet $item\n",
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        style: appstyle(16, Color(kDarkGrey.value),
                            FontWeight.normal),
                      );
                    },
                  ),
                ),
                const HeightSpacer(height: 60),
              ]),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: CustomOutlineBtn(
                    text: "Apply Now",
                    width: width,
                    height: height * 0.05,
                    onTap: () {},
                    color: Color(kOrange.value),
                    textColor: Color(kLight.value),
                    borderColor: Color(kOrange.value),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
