import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';
import '../../../common/app_style.dart';
import '../../../common/height_spacer.dart';
import '../../../common/reusable_text.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const HeightSpacer(height: 65),
            Image.asset("assets/images/page2.png",filterQuality: FilterQuality.high,),
            const HeightSpacer(height: 20),
            Column(
              children: [
                Text("Stable Yourself \n With Your Ability",textAlign: TextAlign.center, style: appstyle(30, Color(kLight.value), FontWeight.w600)),
                const HeightSpacer(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: Text(
                    "We help you find your dream job according to your "
                        "skillsets, location and preference to build your career",
                    textAlign: TextAlign.center,
                    style: appstyle(14, Color(kLight.value), FontWeight.normal),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );

  }
}