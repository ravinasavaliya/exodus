import 'package:exodus/common/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color.dart';
import '../controller/bottombar_controller.dart';

class BuyCryptoScreen extends StatefulWidget {
  const BuyCryptoScreen({Key? key}) : super(key: key);

  @override
  State<BuyCryptoScreen> createState() => _BuyCryptoScreenState();
}

class _BuyCryptoScreenState extends State<BuyCryptoScreen> {
  BottomBarController bottomBarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              bottomBarController.setRemoveBottombar(false);

              bottomBarController.pageIndex = 2;
            },
            child: Icon(Icons.keyboard_backspace, size: Get.height * 0.03)),
        backgroundColor: kThemeDark,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Buy CRYPTO',
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
          colors: [kThemeDark, Color(0xff3A63D5)],
          stops: [0.8, 1.0],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text('Select Payment Method',
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        fontSize: Get.height * 0.032)),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    commonCard(
                        image: ImagePath.bank,
                        title: 'Bank Transfer',
                        subTitle: 'Receive your crypto in a few days',
                        amount: '10000',
                        hight: Get.height * 0.23),
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff6627FA),
                                    Color(0xff4172FD)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.03,
                                vertical: Get.height * 0.007),
                            child: Text(
                              'LOWEST RATES',
                              style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  fontSize: Get.height * 0.015),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                commonCard(
                    image: ImagePath.debitcard,
                    title: 'Debit Card',
                    subTitle: 'Receive your crypto in a few days',
                    amount: '50000',
                    hight: Get.height * 0.2),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                commonCard(
                    image: ImagePath.applepay,
                    title: 'Apple Pay',
                    subTitle: 'Receive your crypto in minutes',
                    amount: '10000',
                    hight: Get.height * 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container commonCard(
      {String? image,
      String? title,
      String? subTitle,
      String? amount,
      double? hight}) {
    return Container(
      height: hight!,
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xff2C304D).withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.003,
          ),
          Image.asset(image!),
          SizedBox(
            height: Get.height * 0.003,
          ),
          Text(title!,
              style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontSize: Get.height * 0.02)),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(subTitle!,
              style: TextStyle(
                  color: kPrimary,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                  fontSize: Get.height * 0.02)),
          SizedBox(
            height: Get.height * 0.007,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff2C304D),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.height * 0.005),
              child: Text(
                'Up to \$${amount}',
                style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: Get.height * 0.015),
              ),
            ),
          )
        ],
      ),
    );
  }
}
