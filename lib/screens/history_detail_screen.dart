import 'package:exodus/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../apiModel/model/responseModel/get_history_response_model.dart';

class HistoryDetail extends StatefulWidget {
  final Datum? model;
  const HistoryDetail({Key? key, this.model}) : super(key: key);

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    print('${widget.model!.entryDateTime}000');
    return Scaffold(
      backgroundColor: kConBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.02, horizontal: Get.width * 0.035),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '${widget.model!.amount}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kYellow,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Personal Note',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    'Add Note',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kPurpal1,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Timestamp',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '${DateFormat('dd MMM yyyy').format(DateTime.parse('${widget.model!.entryDateTime}000'))}, ${DateFormat.jm().format(DateTime.parse('${widget.model!.entryDateTime}000'))}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Deposited to',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '${widget.model!.sendingAddress}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kPurpal1,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received from',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '${widget.model!.receiveAddress}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kPurpal1,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction ID',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '${widget.model!.transactionId}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kPurpal1,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Now',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '€9.29',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${DateFormat('dd MMMM').format(DateTime.parse('${widget.model!.entryDateTime}000'))}',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    '€9.29',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Container(
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                  color: kThemeDark, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need help?',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kWhite.withOpacity(0.8),
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    'Contact Support',
                    style: TextStyle(
                        fontSize: Get.height * .02,
                        fontWeight: FontWeight.w500,
                        color: kPurpal1,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
