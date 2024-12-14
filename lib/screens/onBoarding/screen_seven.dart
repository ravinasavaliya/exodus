import 'package:exodus/common/color.dart';
import 'package:exodus/common/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSevenPage extends StatefulWidget {
  const ScreenSevenPage({Key? key}) : super(key: key);

  @override
  State<ScreenSevenPage> createState() => _ScreenSevenPageState();
}

class _ScreenSevenPageState extends State<ScreenSevenPage>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final AnimationController _controller1 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false, max: 1);
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false, max: 1);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 1.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));
  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: Offset(0.0, 2.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller1,
    curve: Curves.ease,
  ));
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: Offset(0.0, 2.3),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller2,
    curve: Curves.ease,
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.isAnimating);
    print('abx${_controller1.isAnimating}');

    if (_controller.isCompleted &&
        _controller1.isCompleted &&
        _controller2.isCompleted) {
      print(_controller.isAnimating);
      print('abx 11${_controller1.isAnimating}');

      _controller.stop();
      _controller1.stop();
      _controller2.stop();
    } else {
      _controller.forward();
      _controller1.forward();
      _controller2.forward();
    }
    // controller.isCompleted ? controller.stop() : _controller.forward();
    // controller1.isAnimating ? controller.stop() : _controller.forward();
    return Scaffold(
      backgroundColor: Color(0xff303250),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.sevenbg), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.06,
            ),
            Padding(
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
                  Text('Welcome to Exodus',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Get.height * 0.018,
                          color: kWhite,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: Text(
                'Welcome to Exodus',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Get.height * 0.035,
                  color: kWhite,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            // 'https://media0.giphy.com/media/S9Lb4qT9puX3eoIC02/giphy.gif?cid=790b76114dfc5db0592c76ea7db8f08c50cfc19f99592238&rid=giphy.gif&ct=s'
            Container(
                height: Get.height * 0.5,
                width: Get.height * 0.5,
                child: Image.network(
                    'https://media0.giphy.com/media/S9Lb4qT9puX3eoIC02/giphy.gif?cid=790b76114dfc5db0592c76ea7db8f08c50cfc19f99592238&rid=giphy.gif&ct=s')),

            Spacer(),
            SlideTransition(
              position: _offsetAnimation2,
              child: Text(
                'I Already Have a Wallet',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: Get.height * 0.022,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.09,
            ),
            // SlideTransition(
            //   position: _offsetAnimation1,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            //     child: GestureDetector(
            //       onTap: () {
            //         Get.to(BottomBar());
            //       },
            //       child: Container(
            //         height: Get.height * 0.07,
            //         width: Get.width,
            //         decoration: BoxDecoration(
            //             color: kWhite, borderRadius: BorderRadius.circular(30)),
            //         child: Center(
            //           child: Text(
            //             'Create New Wallet',
            //             textAlign: TextAlign.start,
            //             style: TextStyle(
            //               fontSize: Get.height * 0.023,
            //               fontWeight: FontWeight.w500,
            //               color: kBlack,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By continuing, you agree to our ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Get.height * 0.018,
                    color: kGrey1,
                  ),
                ),
                Text(
                  'Terms of use ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: Get.height * 0.02,
                      color: kWhite,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
