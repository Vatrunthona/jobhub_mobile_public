import 'package:flutter/material.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';

import '../../../../constants/app_constants.dart';
import '../../../common/app_style.dart';
import '../../../common/height_spacer.dart';


class DeviceInfo extends StatelessWidget {

  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAddress;

  const DeviceInfo({super.key, required this.location, required this.device, required this.platform, required this.date, required this.ipAddress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
            text: platform,
            style: appstyle(22, Color(kDark.value), FontWeight.bold)
        ),
        ReusableText(
            text: device,
            style: appstyle(22, Color(kDark.value), FontWeight.bold)
        ),
        const HeightSpacer(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: date,
                    style: appstyle(16, Color(kDarkGrey.value), FontWeight.w400)
                ),
                ReusableText(
                    text: ipAddress,
                    style: appstyle(16, Color(kDarkGrey.value), FontWeight.w400)
                ),
              ],
            ),
            CustomOutlineBtn(
              text: 'Sign Out',
              onTap: () {},
              height: height * 0.05,
              width: width * 0.3,
              color: kLight,
              textColor: kOrange,
              borderColor: kOrange,

            )
          ],
        )
      ],
    );
  }
}
