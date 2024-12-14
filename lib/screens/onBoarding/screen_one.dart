import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/images.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with TickerProviderStateMixin {
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
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    '${ImagePath.back2}',
                  ),
                  fit: BoxFit.fill)),
          child: Column(
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
                            Text('Crypto Made Simple',
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
                          'Manage your crypto\n across multiple chains\n all in one place',
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
                height: 100,
              ),
              Container(
                height: Get.height * .22,
                child: Stack(
                  children: [
                    Positioned(
                        right: Get.width * .15,
                        bottom: Get.height * 0.03,
                        top: animationController!.value * 20,
                        child: Image.asset(
                          '${ImagePath.coin}',
                          height: 70,
                          width: 70,
                        )),
                  ],
                ),
              ),
              Container(
                height: Get.height * .16,
                child: Stack(
                  children: [
                    Positioned(
                        left: Get.height * .06,
                        bottom: Get.height * 0.03,
                        top: animationController!.value * 20,
                        child: Image.asset(
                          '${ImagePath.coin1}',
                          height: 40,
                          width: 40,
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
