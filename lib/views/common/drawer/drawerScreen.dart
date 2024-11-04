import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:provider/provider.dart';
import '../../../controllers/zoom_provider.dart';
import '../app_style.dart';
import '../reusable_text.dart';
import '../width_spacer.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({super.key, required this.indexSetter});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return GestureDetector(
          onDoubleTap: () {
            ZoomDrawer.of(context)?.toggle();
          },
            child: Scaffold(
              backgroundColor: Color(kLightBlue.value),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerItem(
                      icon: AntDesign.home,
                      text: 'Home',
                      index: 0,
                      color: zoomNotifier.currentIndex == 0
                          ? Color(kLight.value)
                          : Color(kLightGrey.value),
                  ),
                  drawerItem(
                      icon: AntDesign.wechat,
                      text: 'Chat',
                      index: 1,
                      color: zoomNotifier.currentIndex == 1
                          ? Color(kLight.value)
                          : Color(kLightGrey.value),
                  ),
                  drawerItem(
                      icon: AntDesign.book,
                      text: 'Bookmarks',
                      index: 2,
                      color: zoomNotifier.currentIndex == 2
                          ? Color(kLight.value)
                          : Color(kLightGrey.value),
                  ),
                  drawerItem(
                      icon: AntDesign.setting,
                      text: 'Device Management',
                      index: 3,
                      color: zoomNotifier.currentIndex == 3
                          ? Color(kLight.value)
                          : Color(kLightGrey.value),
                  ),
                  drawerItem(
                      icon: FontAwesome5Regular.user_circle,
                      text: 'Profile',
                      index: 4,
                      color: zoomNotifier.currentIndex == 4
                          ? Color(kLight.value)
                          : Color(kLightGrey.value),
                  ),


                ],
              ),

            )
        );
      }
    );
  }

  Widget drawerItem({required IconData icon, required String text, required int index, required Color color}){
    return GestureDetector(
      onTap: (){
        widget.indexSetter(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Icon(icon, color: color,),
            const WidthSpacer(width: 12),
            ReusableText(text: text, style: appstyle(12, color, FontWeight.bold)),
          ],
        ),
      ),
    );
  }

}



