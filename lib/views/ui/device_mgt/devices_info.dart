import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/device_mgt/widgets/device_info.dart';
import 'package:get/get.dart';
import 'package:jobhub/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import '../../../controllers/login_provider.dart';
import '../../common/app_bar.dart';
import '../../common/drawer/drawerWidget.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {

    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);

    var zoomNotifier = Provider.of<ZoomNotifier>(context, listen: false);
    var onBoardingNotifier = Provider.of<OnBoardNotifier>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const CustomAppBar(
          text: 'Device Management',
          child: DrawerWidget(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'You are logged in into your account on these devices',
                    style: appstyle(16, Color(kDark.value), FontWeight.w600)
                  ),
                  const HeightSpacer(height: 50),
                  DeviceInfo(
                    location: 'Lagos, Nigeria',
                    device: 'Samsung Galaxy S10',
                    platform: 'Android',
                    date: loginDate,
                    ipAddress: '10.0.2.2',
                  ),
                  const HeightSpacer(height: 50),
                  DeviceInfo(
                    location: 'Lagos, Nigeria',
                    device: 'Apple iPhone 12 Pro Max',
                    platform: 'IOS',
                    date: loginDate,
                    ipAddress: '10.0.2.2',
                  ),
                ],
              ),
            ),
            Consumer<LoginNotifier>(
              builder: (context, loginNotifier, child) {
                return Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: GestureDetector(
                    onTap: () {
                      zoomNotifier.currentIndex = 0;
                      onBoardingNotifier.isLastPage = false;
                      Get.to(() => const OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                        text: 'Sign Out from all devices',
                        style: appstyle(16, kOrange, FontWeight.w600)
                      ),
                    ),
                  ),
                );
              }
            )
          ]
        )
      ),
    );
  }
}