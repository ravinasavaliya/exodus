import 'package:exodus/screens/onBoarding/four_screen.dart';
import 'package:exodus/screens/onBoarding/screen_five.dart';
import 'package:exodus/screens/onBoarding/screen_one.dart';
import 'package:exodus/screens/onBoarding/screen_seven.dart';
import 'package:exodus/screens/onBoarding/screen_sex.dart';
import 'package:exodus/screens/onBoarding/screen_three.dart';
import 'package:exodus/screens/onBoarding/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../common/color.dart';
import '../../common/prefnce_manager.dart';
import '../bottom_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  // StoryPageController storyPageController = StoryPageController(
  //     initialPage: 1,
  //     pagingCurve: Curves.ease,
  //     pagingDuration: Duration(seconds: 3),
  //     viewportFraction: 1.0);
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  List? user;
  bool change = false;
  AnimationController? _controller1;

  Animation<double>? _offsetAnimation1;

  @override
  void initState() {
    super.initState();

    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    _controller1!.dispose();
    indicatorAnimationController.dispose();
    super.dispose();
  }

  List screen = [
    Screen1(),
    Screen2(),
    ThirdScreen(),
    FourthScreen(),
    Screen5(),
    Screen6(),
    ScreenSevenPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303250),
      body: StoryPageView(
        itemBuilder: (context, pageIndex, stackIndex) {
          // if (stackIndex == 6) {
          //   print('calling.....');
          //   // setState(() {});
          //   _controller1 = AnimationController(
          //     duration: const Duration(seconds: 3),
          //     vsync: this,
          //   );
          //   // print('_controller1!.isAnimating ${_controller1!.isAnimating}');
          //
          //   _offsetAnimation1 = Tween<double>(
          //     begin: -190,
          //     end: 100,
          //   ).animate(_controller1!)
          //     ..addListener(() {
          //       // setState(() {});
          //       print('_controller1!.isAnimating ${_controller1!.isAnimating}');
          //     });
          //
          //   _controller1!.isAnimating == true
          //       ? _controller1!.stop()
          //       : _controller1!.forward();
          // }

          final story = [
            Screen1(),
            Screen2(),
            ThirdScreen(),
            FourthScreen(),
            Screen5(),
            Screen6(),
            ScreenSevenPage()
          ];
          return story[stackIndex];
        },
        pageLength: 1,
        storyLength: (int pageIndex) {
          return 7;
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return storyIndex == 6
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.05,
                        vertical: Get.height * 0.08),
                    child: GestureDetector(
                      onTap: () async {
                        await PreferenceManager.setIsLogin(value: 'true');

                        Get.to(BottomBar());
                      },
                      child: Container(
                        height: Get.height * 0.07,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'Create New Wallet',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: Get.height * 0.023,
                              fontWeight: FontWeight.w500,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox();
        },
        onPageChanged: (val) {
          print('val>>>> $val');
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 0;
          }
          return 0;
        },
        indicatorPadding: EdgeInsets.only(
            top: Get.height * 0.05,
            right: Get.width * 0.05,
            left: Get.width * 0.05),
        onPageLimitReached: () {
          /// Navigator.pop(context)
        },
      ),
      /* GestureDetector(
          onTapUp: (details) {
            if (details.localPosition.direction > 1.0) {
              storyPageController.previousPage(
                  duration: Duration(milliseconds: 2000), curve: Curves.ease);
            }
            if (details.localPosition.direction < 1.0) {
              storyPageController.nextPage(
                  duration: Duration(milliseconds: 2000), curve: Curves.ease);
              print('Right');
            }
          },
          child: Container(
              child: StoryPageView(
            controller: storyPageController,
            indicatorPosition: StoryPageIndicatorPosition.overlay(
              top: Get.height * 0.04,
              left: Get.width * 0.05,
              right: Get.width * 0.05,
            ),
            indicatorStyle: StoryPageIndicatorStyle(
              height: 3,
              gap: 4,
              unvisitedColor: Colors.white30,
              visitedColor: Colors.white,
              timerBarBackgroundColor:
                  Colors.white54, // default to unvisitedColor
              timerBarColor: Colors.white, // default to vistedColor
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            children: [
              Screen1(),
              Screen2(),
              ThirdScreen(),
              FourthScreen(),
              Screen5(),
              Screen6(),
              ScreenSevenPage()
            ],
          )),
        )*/
    );
  }
}
