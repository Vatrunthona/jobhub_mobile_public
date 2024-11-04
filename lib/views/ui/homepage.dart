import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/heading_widget.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/search.dart';
import 'package:jobhub/views/ui/jobs/job_page.dart';
import 'package:jobhub/views/ui/jobs/widgets/horizontal_tile.dart';
import 'package:jobhub/views/ui/jobs/widgets/job_tile.dart';
import 'package:jobhub/views/ui/search/searchpage.dart';
import '../common/drawer/drawerWidget.dart';
import '../common/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          action: [
            Padding(padding: EdgeInsets.all(12.h),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
          ],
          child: const DrawerWidget(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeightSpacer(height: 10),
                Text(
                  'Search \nFind & Apply',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(kDark.value),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const HeightSpacer(height: 30),
                SearchWidget(
                  onTap: () => Get.to(() => const SearchPage()),
                ),
                const HeightSpacer(height: 20),
                HeadingWidget(
                  text: 'Popular Jobs',
                  onTap: () {},
                ),
                const HeightSpacer(height: 20),
                SizedBox(
                  height: height * 0.3,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const WidthSpacer(width: 20),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return JobHorizontalTile(
                        onTap: () {
                          Get.to(() => const JobPage(
                            title: 'Flutter Developer',
                            id: '1',
                          ));
                        },
                      );
                    },
                  ),
                ),
                const HeightSpacer(height: 20),
                HeadingWidget(
                  text: 'Recently Posted',
                  onTap: () {},
                ),
                const HeightSpacer(height: 20),
                VerticalTileWidget(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}