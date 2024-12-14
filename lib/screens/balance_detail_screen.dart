import 'package:exodus/screens/summery_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color.dart';

class BalanceDetailScreen extends StatefulWidget {
  final String amount;
  BalanceDetailScreen({Key? key, required this.amount}) : super(key: key);

  @override
  State<BalanceDetailScreen> createState() => _BalanceDetailScreenState();
}

class _BalanceDetailScreenState extends State<BalanceDetailScreen>
    with TickerProviderStateMixin {
  List data = ["24H", "7D", "1M", "3M", "6M", "ALL"];
  int change = 0;
  bool isSelect = false;
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  bool hover = false;

  // store the position where your mouse pointer left the widget
  Offset exitFrom = Offset(0, 0);
  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.ease,
    ));

    _controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller!.isCompleted) {
      _controller!.stop();
    } else {
      _controller!.forward();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kConBlack,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close)),
        centerTitle: true,
        title: Text(
          'PORTFOLIO',
          style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: Get.height * 0.02),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [kThemeGradient, kConBlack],
                  begin: Alignment.topCenter,
                  end: Alignment.topCenter)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
            child: Container(
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.28,
                    decoration: BoxDecoration(
                        color: Color(0xff40446B).withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05,
                          vertical: Get.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SlideTransition(
                                position: _offsetAnimation!,
                                child: GestureDetector(
                                  onPanStart: (DragStartDetails val) {
                                    print('starting....');
                                    setState(() {
                                      isSelect = true;
                                    });
                                  },
                                  onPanUpdate: (DragUpdateDetails val) {
                                    print('updating....');
                                    setState(() {
                                      isSelect = true;
                                    });
                                  },
                                  onTap: () {
                                    setState(() {
                                      isSelect = true;
                                    });
                                    print(isSelect);
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      setState(() {
                                        isSelect = false;
                                      });
                                      Get.to(SummeryScreen());
                                    });
                                  },
                                  onPanEnd: (DragEndDetails val) {
                                    print('ending....');
                                    setState(() {
                                      isSelect = false;
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.13,
                                    width: Get.height * 0.13,
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xff40446B).withOpacity(0.3),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: isSelect == true
                                                ? kLightGrey.withOpacity(0.3)
                                                : kLightGrey,
                                            width: 3)),
                                    child: Center(
                                        child: Container(
                                      height: Get.height * 0.105,
                                      width: Get.height * 0.105,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            isSelect == true
                                                ? Color(0xff444394)
                                                    .withOpacity(0.3)
                                                : Color(0xff444394),
                                            isSelect == true
                                                ? Color(0xfff57de8)
                                                    .withOpacity(0.3)
                                                : Color(0xfff57de8),
                                          ])),
                                      child: Center(
                                        child: Text(
                                          'Summary',
                                          style: TextStyle(
                                              fontSize: Get.height * .02,
                                              fontWeight: FontWeight.w500,
                                              color: isSelect == true
                                                  ? kWhite.withOpacity(0.4)
                                                  : kWhite,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              Container(
                                height: Get.height * 0.15,
                                child: VerticalDivider(
                                    color: kLightGrey, thickness: 2),
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Container(
                                width: Get.width * 0.42,
                                child: SlideTransition(
                                  position: _offsetAnimation!,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hexagon,
                                            size: Get.height * 0.025,
                                            color: Color(0xffffbb45),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.015,
                                          ),
                                          Text(
                                            'BTC',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                          Spacer(),
                                          Text(
                                            '0.00%',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hexagon,
                                            size: Get.height * 0.025,
                                            color: kGreyLight,
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.015,
                                          ),
                                          Text(
                                            'ETH',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                          Spacer(),
                                          Text(
                                            '0.00%',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hexagon,
                                            size: Get.height * 0.025,
                                            color: Color(0xff4ccf7e),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.015,
                                          ),
                                          Text(
                                            'USDT',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.005,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: kGrey1.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Get.height * 0.004,
                                                  horizontal: Get.width * 0.02),
                                              child: Center(
                                                child: Text(
                                                  'ETH',
                                                  style: TextStyle(
                                                      color: kWhite,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                      fontSize:
                                                          Get.height * 0.014),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '0.00%',
                                            style: TextStyle(
                                                color: kWhite,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hexagon,
                                            size: Get.height * 0.025,
                                            color: Color(0xff4ccf7e),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.015,
                                          ),
                                          Text(
                                            'USDT',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.005,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: kGrey1.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Get.height * 0.004,
                                                  horizontal: Get.width * 0.02),
                                              child: Center(
                                                child: Text(
                                                  'SOL',
                                                  style: TextStyle(
                                                      color: kWhite,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                      fontSize:
                                                          Get.height * 0.014),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            '0.00%',
                                            style: TextStyle(
                                                color: kWhite.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto',
                                                fontSize: Get.height * 0.018),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          SlideTransition(
                            position: _offsetAnimation!,
                            child: Column(
                              children: [
                                Text(
                                  '\€${widget.amount}',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto',
                                      fontSize: Get.height * 0.022),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Total Balance',
                            style: TextStyle(
                                color: kWhite.withOpacity(0.6),
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Roboto',
                                fontSize: Get.height * 0.018),
                          ),
                          Spacer(),
                          SlideTransition(
                            position: _offsetAnimation!,
                            child: Container(
                              height: Get.height * 0.002,
                              color: kLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.5709,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        gradient: new LinearGradient(
                            colors: [
                              Color(0xff40446B),
                              kConBlack,
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            tileMode: TileMode.repeated)),
                    child: SlideTransition(
                      position: _offsetAnimation!,
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.002,
                            color: Color(0xfff57de8),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              data.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    change = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: change != index
                                          ? Colors.transparent
                                          : Color(0xff40446B).withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.004,
                                        horizontal: Get.width * 0.02),
                                    child: Center(
                                      child: Text(
                                        '${data[index]}',
                                        style: TextStyle(
                                            color: kWhite,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Roboto',
                                            fontSize: Get.height * 0.02),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Divider(
                            color: kLightGrey,
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '\€${widget.amount}',
                                      style: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          fontSize: Get.height * 0.025),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      'Change',
                                      style: TextStyle(
                                          color: kPrimary,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          fontSize: Get.height * 0.018),
                                    ),
                                  ],
                                ),
                              )),
                              SizedBox(
                                height: Get.height * 0.06,
                                child: VerticalDivider(
                                  color: kLightGrey,
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '-',
                                      style: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          fontSize: Get.height * 0.025),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      'Portfolio Age',
                                      style: TextStyle(
                                          color: kPrimary,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          fontSize: Get.height * 0.018),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
