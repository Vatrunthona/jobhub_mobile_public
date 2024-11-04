import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/width_spacer.dart';
import 'package:jobhub/views/ui/auth/profile.dart';
import 'package:jobhub/views/ui/bookmarks/bookmarks.dart';
import 'package:jobhub/views/ui/chat/chatpage.dart';
import 'package:jobhub/views/ui/device_mgt/devices_info.dart';
import 'package:jobhub/views/ui/homepage.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../controllers/zoom_provider.dart';
import '../common/drawer/drawerScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: DrawerScreen(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          mainScreen: currentScreen(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          slideWidth: 230.w,
          menuBackgroundColor: Color(kLightBlue.value),
        );
      }
    );
  }
  Widget currentScreen(){
    final zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch(zoomNotifier.currentIndex){
      case 0:
        return HomePage();
      case 1:
        return ChatsPage();
      case 2:
        return BookMarkPage();
      case 3:
        return DeviceManagement();
      case 4:
        return ProfilePage();
      default:
        return HomePage();
    }
  }
}








