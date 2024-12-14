import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/images.dart';

class Screen6 extends StatefulWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> with TickerProviderStateMixin {
  AnimationController? animationController;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 0.4),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
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
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("${ImagePath.screen6Bg}"), fit: BoxFit.fill)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: Get.height * .14,
            width: Get.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: Get.height * 0.06,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: Get.height * 0.025,
                          backgroundImage: AssetImage(ImagePath.profile),
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        Text('Get Help Anytime',
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
                    top: Get.height * 0.1,
                    left: 0,
                    right: 0,
                    child: SlideTransition(
                      position: _offsetAnimation,
                      child: Text(
                        "Rest assured, we have\nyour back with 24/7\nhuma support",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Get.height * 0.03,
                            color: kWhite,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
