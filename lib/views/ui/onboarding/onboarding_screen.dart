import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_one.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_three.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controllers/onboarding_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Consumer(builder: (context, OnBoardNotifier notifier, child) {
      return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pageController,
              physics: notifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              onPageChanged: (index) {
                notifier.isLastPage = index == 2;
              },
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),
            Positioned(
              height: height * 0.2,
              left: 0,
              right: 0,
              child: notifier.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                          activeDotColor: Color(kLight.value),
                          spacing: 10,
                          dotHeight: 12,
                          dotWidth: 12,
                        ),
                      ),
                    ),
            ),
            Positioned(
              // left: 0,
              // right: 0,
              child: notifier.isLastPage
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.easeInOutQuint);
                              },
                              child: ReusableText(
                                  text: "Skip",
                                  style: appstyle(16, Color(kLight.value),
                                      FontWeight.w500)),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOutQuint);
                              },
                              child: ReusableText(
                                  text: "Next",
                                  style: appstyle(16, Color(kLight.value),
                                      FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
