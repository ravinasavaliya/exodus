import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/images.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen>
    with TickerProviderStateMixin {
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
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "${ImagePath.collectNfts}",
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
                          Text('Collect NFTs',
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
                        "Collect NFTs and\n view them in your\n personal gallery",
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
          ]),
        ),
      ),
    );
  }
}
