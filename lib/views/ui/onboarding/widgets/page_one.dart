import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import '../../../../constants/app_constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const HeightSpacer(height: 70),
            Image.asset("assets/images/page1.png",filterQuality: FilterQuality.high,),
            const HeightSpacer(height: 40),
            Column(
              children: [
                ReusableText(text: "Find Your Dream Job", style: appstyle(30, Color(kLight.value), FontWeight.w600)),
                const HeightSpacer(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
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