import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/images.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 1.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));
  initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationController!.addListener(() => setState(() {}));

    TickerFuture tickerFuture = animationController!.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.isAnimating ? _controller.stop() : _controller.forward();
    return Scaffold(
      backgroundColor: Color(0xff303250),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "${ImagePath.earnReword}",
                ))),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: Get.height * .14,
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height * 0.06,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: Get.height * 0.025,
                            backgroundImage: AssetImage(ImagePath.profile),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text('Earn Rewards',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: Get.height * 0.018,
                                  color: kWhite,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto')),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: Text(
                        "Or simply hold your\n crupto to earn more\n with exodus rewards",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Get.height * 0.03,
                            color: kWhite,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 80,
                  width: 91,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          right: Get.width * 0.1,
                          top: animationController!.value * 10,
                          child: Image.asset(
                            "${ImagePath.third_icon}",
                            width: 60,
                            // width: Get.height * 0.08,
                            height: 60,
                            // height: Get.width * 0.08,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 10,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: Get.width * 0.06,
                          height: Get.height * 0.12,
                          width: Get.height * 0.12,
                          top: animationController!.value * 10,
                          child: Image.asset(
                            "${ImagePath.third_icon1}",
                            width: 50,
                            height: 50,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
