import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class VerticalTileWidget extends StatelessWidget {
  final Function? onTap;
  const VerticalTileWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: height * 0.15,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        color: Color(kLightGrey.value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(kLightGrey.value),
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/slack.png'),
                    ),
                    const WidthSpacer(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReusableText(text: "Slack", style: appstyle(20, Color(kDark.value), FontWeight.w600 )),
                        SizedBox(
                          width: width * 0.5,
                          child: ReusableText(text: "Flutter Developer", style: appstyle(20, Color(kDarkGrey.value), FontWeight.w600 )),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Color(kLight.value),
                      radius: 18,
                      child: Icon(Ionicons.chevron_forward, color: Color(kDark.value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                ReusableText(text: "20k", style: appstyle(23, Color(kDark.value), FontWeight.w600 )),
                ReusableText(text: "/monthly", style: appstyle(18, Color(kDarkGrey.value), FontWeight.w600 )),
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}