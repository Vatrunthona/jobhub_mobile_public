import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../../../constants/app_constants.dart';
import '../../../common/app_style.dart';
import '../../../common/height_spacer.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png",filterQuality: FilterQuality.high,),
            const HeightSpacer(height: 25),
            ReusableText(text: "Welcome To JobHub", style: appstyle(30, Color(kLight.value), FontWeight.w600)),
            const HeightSpacer(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "We help you find your dream job according to your "
                    "skillsets, location and preference to build your career",
                textAlign: TextAlign.center,
                style: appstyle(14, Color(kLight.value), FontWeight.normal),
              ),
            ),
            const HeightSpacer(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  text: "Login",
                  width: width * 0.4,
                  height: height * 0.06,
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("entryPoint", true);
                    Get.to(() => const LoginPage());
                  },
                  textColor: Color(kLight.value),
                  borderColor: Color(kLight.value),
                ),
                CustomOutlineBtn(
                  text: "Sign Up",
                  width: width * 0.4,
                  height: height * 0.06,
                  onTap: () {
                    Get.to(() => const LoginPage());
                  },
                  color: Color(kLight.value),
                  textColor: Color(kLightBlue.value),
                  borderColor: Color(kLightBlue.value),
                ),
              ],
            ),
            const HeightSpacer(height: 30),
            ReusableText(text: "Continue as Guest", style: appstyle(16, Color(kLight.value), FontWeight.w400))

          ],
        ),
      ),
    );

  }
}