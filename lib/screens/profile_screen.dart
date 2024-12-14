import 'package:carousel_slider/carousel_slider.dart';
import 'package:exodus/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../common/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  int _current = 0;

  List image = [
    ImagePath.slider,
    ImagePath.slider,
    ImagePath.slider,
    ImagePath.slider,
    ImagePath.slider,
  ];
  List icon = [
    ImagePath.share,
    ImagePath.ftx,
    ImagePath.nfts,
    ImagePath.connect,
    ImagePath.lightning,
    ImagePath.buycrypto,
  ];
  List iconString = [
    'Shares',
    'FTX',
    'NFTs',
    'Connect',
    'Lightning',
    'Buy Crypto'
  ];
  List iconProfile = [
    ImagePath.assets,
    ImagePath.security,
    ImagePath.setting,
    ImagePath.support,
  ];
  List iconProfileString = [
    'Assets',
    'Security',
    'Settings',
    'Support',
  ];
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 3.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.ease,
    ));

    _controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  CarouselController buttonCarouselController = CarouselController();

  @override
  void dispose() {
    // TODO: implement dispose

    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller!.isCompleted ? _controller!.stop() : _controller!.forward();
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kThemeGradient, kThemeDark],
              begin: Alignment.topCenter,
              end: Alignment.topCenter)),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Center(
                child: Text(
                  'PROFILE',
                  style: TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      fontSize: Get.height * 0.02),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Stack(
                children: [
                  CarouselSlider(
                      items: image
                          .map((e) => Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.03),
                                child: Container(
                                  height: Get.height,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      color: kThemeDark,
                                      borderRadius: BorderRadius.circular(17),
                                      image: DecorationImage(
                                          image: AssetImage(e),
                                          fit: BoxFit.fill)),
                                ),
                              ))
                          .toList(),
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          height: Get.height * 0.25,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.88,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.easeInOutBack,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          })),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.01,
                      left: Get.width * 0.15,
                      right: Get.width * 0.15,
                    ),
                    child: SizedBox(
                      height: Get.height * 0.005,
                      child: StepProgressIndicator(
                        totalSteps: 5,
                        roundedEdges: Radius.circular(3),
                        currentStep: _current,
                        selectedColor: Colors.white,
                        unselectedColor: Colors.white30,
                      ),
                    ),
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: image.asMap().entries.map((entry) {
                  //     return GestureDetector(
                  //       onTap: () =>
                  //           buttonCarouselController.animateToPage(entry.key),
                  //       child: Container(
                  //         width: 30.0,
                  //         height: 7.0,
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 8.0, horizontal: 4.0),
                  //         decoration: BoxDecoration(
                  //             color:
                  //                 (Theme.of(context).brightness == Brightness.dark
                  //                         ? Colors.white
                  //                         : Colors.black)
                  //                     .withOpacity(
                  //                         _current == entry.key ? 0.9 : 0.4)),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SlideTransition(
                position: _offsetAnimation!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.067),
                      child: Wrap(
                        children: List.generate(
                            icon.length,
                            (index) => Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: Get.width * 0.02,
                                          bottom: Get.height * 0.02),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: Get.height * 0.09,
                                            width: Get.height * 0.09,
                                            decoration: BoxDecoration(
                                                color: Color(0xff2C304D)
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: SvgPicture.asset(
                                                    icon[index])),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          Text(iconString[index],
                                              style: TextStyle(
                                                  color: kWhite,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                  fontSize:
                                                      Get.height * 0.017)),
                                        ],
                                      ),
                                    ),
                                    index == 5
                                        ? Positioned(
                                            left: 0,
                                            right: 0,
                                            top: -Get.height * 0.01,
                                            child: Center(
                                              child: Container(
                                                height: Get.height * 0.023,
                                                width: Get.width * 0.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Color(0xffFF3985),
                                                      kLightPurpal,
                                                    ])),
                                                child: Center(
                                                    child: Text(
                                                  'NEW',
                                                  style: TextStyle(
                                                      color: kWhite,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                      fontSize:
                                                          Get.height * 0.014),
                                                )),
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                )),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.067),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            color: kPrimary,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: Get.height * 0.018),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.067),
                      child: Row(
                        children: List.generate(
                            iconProfile.length,
                            (index) => Padding(
                                  padding: EdgeInsets.only(
                                      right: Get.width * 0.02,
                                      bottom: Get.height * 0.02),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Get.height * 0.09,
                                        width: Get.height * 0.09,
                                        decoration: BoxDecoration(
                                            color: Color(0xff2C304D)
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: SvgPicture.asset(
                                                iconProfile[index])),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Text(iconProfileString[index],
                                          style: TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto',
                                              fontSize: Get.height * 0.017)),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
