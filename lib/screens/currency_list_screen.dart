import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/color.dart';
import '../common/images.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  int isTap = 0;
  bool isLoading = false;
  List<Map<String, dynamic>> data2 = [];
  var data;
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
  void getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse('https://irisinformatics.net/coin/wb/coins'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      Map<String, dynamic> data1 = data['data'];

      data1.forEach((key, value) {
        data2.add({'name': key, 'value': value});
        print('KEY $key VALUE $value');
      });

      print('DATA LENGTH: ${data2.length}');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kThemeGradient, kThemeDark],
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter)),
            child: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                    color: Color(0xff8F7AE1),
                  ))
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.height * .02),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        appBarWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Add or remove assets from favorites',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Get.height * .014,
                              fontWeight: FontWeight.w600,
                              color: kWhite.withOpacity(0.5),
                              fontFamily: 'Roboto'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textFiledWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: kDarkGrey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Image.asset('${Images[index]}'),
                                      Text(
                                        '    ${data2[index]['name']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: Get.height * .018,
                                            //fontWeight: FontWeight.w100,
                                            color: kWhite,
                                            fontFamily: 'Roboto'),
                                      ),
                                      Text(
                                        '  ${data2[index]['value']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: Get.height * .016,
                                            fontWeight: FontWeight.w600,
                                            color: kDarkGrey,
                                            fontFamily: 'Roboto'),
                                      ),
                                      Spacer(),
                                      isTap == index
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isTap = index;
                                                });
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Color(0xffFF3985),
                                                      kLightPurpal,
                                                    ])),
                                                child: Icon(Icons.done,
                                                    color: kWhite, size: 13),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isTap = index;
                                                });
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: kGrey1)),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                        )
                      ],
                    ),
                  )));
  }

  Padding textFiledWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: kDarkGrey.withOpacity(0.1),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: kGrey1, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: kDarkGrey, width: 1),
            ),
            prefixIcon: Icon(Icons.search, color: kWhite),
            hintText: 'Search...',
            hintStyle: TextStyle(
                fontSize: Get.height * .016,
                fontWeight: FontWeight.w400,
                color: kDarkGrey,
                fontFamily: 'Roboto')),
      ),
    );
  }

  Row appBarWidget() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: kWhite),
        Spacer(),
        Text(
          'EDIT FAVORITES',
          style: TextStyle(
              fontSize: Get.height * .019,
              fontWeight: FontWeight.w600,
              color: kDarkGrey,
              fontFamily: 'Roboto'),
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.transparent),
      ],
    );
  }
}
