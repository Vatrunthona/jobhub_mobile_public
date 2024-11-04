import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';

import '../../../common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  final VoidCallback onTap;
  const JobHorizontalTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.85,
          height: height * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundImage: AssetImage('assets/images/Facebook.png'),
                  ),
                  const WidthSpacer(width: 15),
                  ReusableText(text: "Facebook", style: appstyle(26, Color(kDark.value), FontWeight.w600)),
                ],
              ),
              const HeightSpacer(height: 15),
              ReusableText(text: "Senior Flutter Developer", style: appstyle(20, Color(kDark.value), FontWeight.w600)),
              ReusableText(text: "Washington DC", style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        ReusableText(text: "15K", style: appstyle(23, Color(kDark.value), FontWeight.w600)),
                        ReusableText(text: "/monthly", style: appstyle(23, Color(kDark.value), FontWeight.w600)),
                      ]
                  ),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(Ionicons.chevron_forward),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}