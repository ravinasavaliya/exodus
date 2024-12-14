import 'package:exodus/common/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../common/color.dart';

class ExchangeScreen extends StatefulWidget {
  final ScrollController? scrollController;
  ExchangeScreen({Key? key, this.scrollController}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen>
    with TickerProviderStateMixin {
  bool selected = false;
  Animation<double>? animation;

  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = Tween<double>(begin: 0, end: -190).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kThemeDark,
          elevation: 0,
          leading: SizedBox(),
          centerTitle: true,
          title: Text(
            'EXCHANGE',
            style: TextStyle(
                color: kPrimary,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: Get.height * 0.02),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.05),
              child: SvgPicture.asset(
                IconPath.clock,
                height: Get.height * 0.025,
                width: Get.height * 0.025,
              ),
            )
          ]),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kThemeGradient, kThemeDark],
                begin: Alignment.topCenter,
                end: Alignment.topCenter)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: ListView(
            controller: widget.scrollController,
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              selected == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I have 0 Bitcoin',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02)),
                        Text('\$0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I want Bitcoin',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02)),
                        Text('\$0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02))
                      ],
                    ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              selected == false
                  ? Row(
                      children: [
                        Transform.translate(
                          offset: Offset(0, -animation!.value),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagePath.btc,
                                height: Get.height * 0.04,
                                width: Get.height * 0.04,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text('BTC',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: Get.height * 0.03)),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: Get.height * 0.04,
                                color: Color(0xff5C5F7B),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text('0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.03))
                      ],
                    )
                  : Row(
                      children: [
                        Transform.translate(
                          offset: Offset(0, -animation!.value),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagePath.eth,
                                height: Get.height * 0.04,
                                width: Get.height * 0.04,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text('ETH',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: Get.height * 0.03)),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: Get.height * 0.04,
                                color: Color(0xff5C5F7B),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text('0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.03))
                      ],
                    ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: kPrimary,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      animationController = AnimationController(
                          vsync: this, duration: Duration(milliseconds: 500));
                      animation = Tween<double>(begin: 0, end: -190)
                          .animate(animationController!)
                        ..addListener(() {
                          setState(() {});
                        });

                      selected = !selected;
                      animationController!.forward();
                      // animationController1!.reverse();
                    },
                    child: Transform.rotate(
                      angle: selected == false
                          ? animation!.value
                          : animation!.value + 300,
                      child: CircleAvatar(
                          radius: Get.height * 0.03,
                          backgroundColor: Color(0xff33354C),
                          child: SvgPicture.asset(ImagePath.reference)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              selected == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I want Bitcoin',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02)),
                        Text('\$0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I have 0 Bitcoin',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02)),
                        Text('\$0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.02))
                      ],
                    ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              selected == false
                  ? Row(
                      children: [
                        Transform.translate(
                          offset: Offset(0, animation!.value),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagePath.eth,
                                height: Get.height * 0.04,
                                width: Get.height * 0.04,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text('ETH',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: Get.height * 0.03)),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: Get.height * 0.04,
                                color: Color(0xff5C5F7B),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text('0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.03))
                      ],
                    )
                  : Row(
                      children: [
                        Transform.translate(
                          offset: Offset(0, animation!.value),
                          child: Row(
                            children: [
                              Image.asset(
                                ImagePath.btc,
                                height: Get.height * 0.04,
                                width: Get.height * 0.04,
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Text('BTC',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: Get.height * 0.03)),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: Get.height * 0.04,
                                color: Color(0xff5C5F7B),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text('0.00',
                            style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.03))
                      ],
                    ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Container(
                height: Get.height * 0.075,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kConBlack,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MIN',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: Get.height * 0.02)),
                      Text('HALF',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: Get.height * 0.02)),
                      Text('MAX',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: Get.height * 0.02)),
                    ],
                  ),
                ),
              ),
              /*  SizedBox(
            width: 200,
            height: 350,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  width: selected ? 200.0 : 50.0,
                  height: selected ? 50.0 : 200.0,
                  top: selected ? 50.0 : 150.0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      color: Colors.blue,
                      child: const Center(child: Text('Tap me')),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
              SizedBox(
                height: Get.height * 0.2,
              ),
              Column(
                children: [
                  Text('1 BTC = 13.823324 ETH',
                      style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          fontSize: Get.height * 0.02)),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                      'Exchange services are availble through \nthird-party API providers.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto',
                          fontSize: Get.height * 0.02)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:exodus/common/images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../common/color.dart';
//
// class ExchangeScreen extends StatefulWidget {
//   final ScrollController? scrollController;
//   ExchangeScreen({Key? key, this.scrollController}) : super(key: key);
//
//   @override
//   State<ExchangeScreen> createState() => _ExchangeScreenState();
// }
//
// class _ExchangeScreenState extends State<ExchangeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: kThemeDark,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             'EXCHANGE',
//             style: TextStyle(
//                 color: kPrimary,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'Roboto',
//                 fontSize: Get.height * 0.02),
//           ),
//           actions: [SvgPicture.asset(IconPath.clock)]),
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [kThemeGradient, kThemeDark],
//                 begin: Alignment.topCenter,
//                 end: Alignment.topCenter)),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//           child: ListView(
//             controller: widget.scrollController,
//             children: [
//               SizedBox(
//                 height: Get.height * 0.04,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('I have 0 Bitcoin',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02)),
//                   Text('\$0.00',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02))
//                 ],
//               ),
//               SizedBox(
//                 height: Get.height * 0.02,
//               ),
//               Row(
//                 children: [
//                   Image.asset(
//                     ImagePath.btc,
//                     height: Get.height * 0.04,
//                     width: Get.height * 0.04,
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.02,
//                   ),
//                   Text('BTC',
//                       style: TextStyle(
//                           color: kWhite,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.03)),
//                   Icon(
//                     Icons.arrow_drop_down_outlined,
//                     size: Get.height * 0.04,
//                     color: Color(0xff5C5F7B),
//                   ),
//                   Spacer(),
//                   Text('0.00',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.03))
//                 ],
//               ),
//               SizedBox(
//                 height: Get.height * 0.04,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: kPrimary,
//                     ),
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.01,
//                   ),
//                   CircleAvatar(
//                       radius: Get.height * 0.03,
//                       backgroundColor: Color(0xff33354C),
//                       child: Image.asset(ImagePath.reference))
//                 ],
//               ),
//               SizedBox(
//                 height: Get.height * 0.04,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('I want Bitcoin',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02)),
//                   Text('\$0.00',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02))
//                 ],
//               ),
//               SizedBox(
//                 height: Get.height * 0.02,
//               ),
//               Row(
//                 children: [
//                   Image.asset(
//                     ImagePath.eth,
//                     height: Get.height * 0.04,
//                     width: Get.height * 0.04,
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.02,
//                   ),
//                   Text('ETH',
//                       style: TextStyle(
//                           color: kWhite,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.03)),
//                   Icon(
//                     Icons.arrow_drop_down_outlined,
//                     size: Get.height * 0.04,
//                     color: Color(0xff5C5F7B),
//                   ),
//                   Spacer(),
//                   Text('0.00',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.03))
//                 ],
//               ),
//               SizedBox(
//                 height: Get.height * 0.05,
//               ),
//               Container(
//                 height: Get.height * 0.075,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40),
//                   color: kConBlack,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: Get.height * 0.05),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('MIN',
//                           style: TextStyle(
//                               color: kWhite,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Roboto',
//                               fontSize: Get.height * 0.02)),
//                       Text('HALF',
//                           style: TextStyle(
//                               color: kWhite,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Roboto',
//                               fontSize: Get.height * 0.02)),
//                       Text('MAX',
//                           style: TextStyle(
//                               color: kWhite,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Roboto',
//                               fontSize: Get.height * 0.02)),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: Get.height * 0.2,
//               ),
//               Column(
//                 children: [
//                   Text('1 BTC = 13.823324 ETH',
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02)),
//                   SizedBox(
//                     height: Get.height * 0.02,
//                   ),
//                   Text(
//                       'Exchange services are availble through \nthird-party API providers.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: kPrimary,
//                           fontWeight: FontWeight.w300,
//                           fontFamily: 'Roboto',
//                           fontSize: Get.height * 0.02)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
