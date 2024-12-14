import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/images.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with TickerProviderStateMixin {
  AnimationController? animationController;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 1.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));
  @override
  initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    '${ImagePath.back}',
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                            Text('Buy and Exchange',
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
                          'Buy and exchange\n hundreds of crypto\n assets instantly',
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
              Container(
                height: Get.height * .19,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: Get.height * .06,
                        bottom: -Get.height * .09,
                        top: animationController!.value * 20,
                        child: Image.asset(
                          '${ImagePath.doller2}',
                          height: 60,
                          width: 60,
                        )),
                    Positioned(
                        right: Get.width * .13,
                        bottom: -Get.height * .09,
                        top: animationController!.value * 20,
                        child: Image.asset(
                          '${ImagePath.doller}',
                          height: 40,
                          width: 40,
                        )),
                  ],
                ),
              ),
              Container(
                height: Get.height * .13,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        right: Get.height * .1,
                        bottom: animationController!.value * 20,
                        top: Get.height * .01,
                        child: Image.asset(
                          '${ImagePath.doller1}',
                          height: 70,
                          width: 70,
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
