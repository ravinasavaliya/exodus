import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color.dart';
import '../common/images.dart';

class SummeryScreen extends StatefulWidget {
  const SummeryScreen({Key? key}) : super(key: key);

  @override
  State<SummeryScreen> createState() => _SummeryScreenState();
}

class _SummeryScreenState extends State<SummeryScreen>
    with TickerProviderStateMixin {
  List Images = [
    '${ImagePath.alogrand}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
    '${ImagePath.currency}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
    '${ImagePath.alogrand}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
    '${ImagePath.currency}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
    '${ImagePath.alogrand}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
    '${ImagePath.currency}',
    '${ImagePath.bitCoin}',
    '${ImagePath.etheream}',
    '${ImagePath.solana}',
  ];
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(begin: Offset(0.0, 10.0), end: Offset.zero)
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
              // Get.off(BalanceDetailScreen());
            },
            child: Icon(Icons.arrow_back_sharp)),
        centerTitle: true,
        title: Text(
          'PORTFOLIO SUMMERY',
          style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: Get.height * 0.02),
        ),
      ),
      body: Container(
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Images.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SlideTransition(
                              position: _offsetAnimation!,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Image.asset(
                                        '${Images[index]}',
                                        height: 45,
                                        width: 45,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        '  BTC',
                                        style: TextStyle(color: kWhite),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Divider(
                                        color: kWhite,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ' 0.00%',
                                        style: TextStyle(color: kWhite),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      },
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
