import 'dart:convert';
import 'dart:developer';

import 'package:exodus/apiModel/api_services/api_services/api_response.dart';
import 'package:exodus/apiModel/model/responseModel/get_history_response_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/color.dart';
import '../common/images.dart';
import '../controller/favourite_controller.dart';
import '../controller/get_history_viewmodel.dart';
import 'currency_list_screen.dart';
import 'history_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController? scrollController;
  HomeScreen({Key? key, this.scrollController}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? isTap;
  List Images = [
    '${ImagePath.abccoin}',
    '${ImagePath.abccoin}',
    '${ImagePath.actcoin}',
    '${ImagePath.actcoin}',
    '${ImagePath.adacoin}',
  ];
  List headings = ['Alogrand', 'Bitcoin', 'Ethereum', 'Solana'];
  List bitCoinImage = [
    '${ImagePath.bit_coin}',
    '${ImagePath.bit_coin1}',
    '${ImagePath.bit_coin}',
    '${ImagePath.bit_coin1}'
  ];
  List rupees = ['\$034', '\$.25,25.22', '\$.14,251.2', '\$.32.03'];
  List text = ['0.02%', '0.07%', '0.02%', '0.002%'];
  List<Color> gradientColors = [
    const Color(0xffFF3985),
    const Color(0xff282A44),
  ];
  List<Map<String, dynamic>> data2 = [];
  List imageColumnList = [
    ImagePath.bit_coin2,
    ImagePath.rectangle1,
    ImagePath.rectangle2,
    ImagePath.rectangle3,
    ImagePath.rectangle4,
    ImagePath.rectangle5,
  ];

  bool showAvg = false;
  bool isLoading = false;
  FavouriteController favouriteController = Get.put(FavouriteController());
  GetHistoryViewModel getHistoryViewModel = Get.find();
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
    favouriteController.data2.clear();
    for (int i = 0; i <= 4; i++) {
      favouriteController.addFavourite(data2[i]);
    }
    print('favouriteController>>> ${favouriteController.data2}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    getHistoryViewModel.getHistoryViewModel();
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * .02),
              child: ListView(
                controller: widget.scrollController,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  topWidget(),
                  commonSized(),
                  divider(),
                  commonSized(),
                  chartWidget(),
                  sizedBoxCommon(),
                  tabBar(),
                  sizedBoxCommon(),
                  GetBuilder<GetHistoryViewModel>(
                    builder: (historyController) {
                      if (historyController.apiResponse.status ==
                          Status.LOADING) {
                        return SizedBox();
                      }
                      if (historyController.apiResponse.status ==
                          Status.ERROR) {
                        return Center(
                          child: Text(
                            'Server error....',
                            style: TextStyle(
                                fontSize: Get.height * .016,
                                fontWeight: FontWeight.w500,
                                color: kWhite,
                                fontFamily: 'Roboto'),
                          ),
                        );
                      }
                      GetHistoryResponseModel responseModel =
                          historyController.apiResponse.data;
                      return responseModel.data!.isEmpty
                          ? SizedBox()
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recent Activity',
                                      style: TextStyle(
                                          fontSize: Get.height * .018,
                                          fontWeight: FontWeight.w600,
                                          color: kWhite,
                                          fontFamily: 'Roboto'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(CurrencyListScreen());
                                      },
                                      child: Text(
                                        'See All',
                                        style: TextStyle(
                                            fontSize: Get.height * .014,
                                            fontWeight: FontWeight.w400,
                                            color: kGrey1,
                                            fontFamily: 'Roboto'),
                                      ),
                                    ),
                                  ],
                                ),
                                commonSized(),
                                Container(
                                  height: Get.height * 0.14,
                                  width: Get.width,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: responseModel.data!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(HistoryDetail(
                                                  model: responseModel
                                                      .data![index],
                                                ));
                                              },
                                              child: Container(
                                                width: Get.height * 0.1,
                                                height: Get.height * 0.1,
                                                decoration: BoxDecoration(
                                                    color: kConBlack,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        ImagePath.btc,
                                                        width: 32,
                                                        height: 32,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        // 'RTc',
                                                        '${responseModel.data![index].amount!.split(' ').last}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                Get.height *
                                                                    .016,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kWhite,
                                                            fontFamily:
                                                                'Roboto'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Received',
                                              style: TextStyle(
                                                  fontSize: Get.height * .016,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      kWhite.withOpacity(0.6),
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                  sizedBoxCommon(),
                  centerText(),
                  commonSized(),
                  listViews(),
                  commonSized(),
                  secoundListView(),
                  commonSized(),
                  thirdListView(),
                  commonSized(),
                  dipositContainer(),
                  commonSized(),
                  verticalListView(),
                  commonSized(),
                  bottomWidget(),
                  commonSized(),
                ],
              ),
            )));
  }

  Container bottomWidget() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('${ImagePath.dote_button}'),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('${ImagePath.desBoard}', height: 30, width: 30),
          Text(
            '     Customize Dashboard',
            style: TextStyle(
                fontSize: Get.height * .019,
                fontWeight: FontWeight.w600,
                color: kDarkGrey,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }

  Container verticalListView() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kConBlack),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: imageColumnList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTap = index;
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          isTap = null;
                        });
                      });
                      print('ffgvdfr`');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isTap == index
                            ? Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: kConBlack,
                                    image: DecorationImage(
                                      colorFilter: new ColorFilter.mode(
                                          kConBlack.withOpacity(0.2),
                                          BlendMode.dstATop),
                                      image: ExactAssetImage(
                                          '${imageColumnList[index]}'),
                                    )))
                            : Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  '${imageColumnList[index]}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Crypto  Market  Maker',
                              style: TextStyle(
                                  fontSize: Get.height * .019,
                                  fontWeight: FontWeight.w600,
                                  color: isTap == index
                                      ? Color(0xff3E4356)
                                      : kWhite,
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Wintermute Hacked for \$659....',
                              style: TextStyle(
                                  fontSize: Get.height * .019,
                                  fontWeight: FontWeight.w600,
                                  color: isTap == index
                                      ? Color(0xff3E4356)
                                      : kWhite,
                                  fontFamily: 'Roboto'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2 hours ago  |  CoinDesk',
                              style: TextStyle(
                                  fontSize: Get.height * .017,
                                  fontWeight: FontWeight.w600,
                                  color: isTap == index
                                      ? Color(0xff3E4356)
                                      : kLightGrey,
                                  fontFamily: 'Roboto'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget dipositContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 206,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage('${ImagePath.container}')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LIGHTNING WALLET',
                          style: TextStyle(
                              fontSize: Get.height * .018,
                              fontWeight: FontWeight.w600,
                              color: kLightGrey,
                              fontFamily: 'Roboto'),
                        ),
                        commonSized(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${ImagePath.bitCoin}',
                              width: 40,
                              height: 45,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              children: [
                                Text(
                                  '    0 BTC',
                                  style: TextStyle(
                                      fontSize: Get.height * .019,
                                      fontWeight: FontWeight.w600,
                                      color: kWhite,
                                      fontFamily: 'Roboto'),
                                ),
                                Text(
                                  '   \$0.00',
                                  style: TextStyle(
                                      fontSize: Get.height * .014,
                                      fontWeight: FontWeight.w400,
                                      color: kLightGrey,
                                      fontFamily: 'Roboto'),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: Image.asset(
                        '${ImagePath.light}',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                sizedBoxCommon(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${ImagePath.button}'))),
                  child: Center(
                    child: Text(
                      'Deposit Bitcoin to Lightning',
                      style: TextStyle(
                          fontSize: Get.height * .016,
                          fontWeight: FontWeight.w600,
                          color: kWhite,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        commonSized(),
        Text(
          'Trending News',
          style: TextStyle(
              fontSize: Get.height * .019,
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Column secoundListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: bitCoinImage.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: Get.height * .2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kConBlack),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        '${bitCoinImage[index]}',
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: Get.height * .016,
                              fontWeight: FontWeight.w600,
                              color: kGrey1,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Learn hoe to buy\ncrypto',
                          style: TextStyle(
                              fontSize: Get.height * .018,
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        commonSized(),
        commonSized(),
        Text(
          'Top Movers',
          style: TextStyle(
              fontSize: Get.height * .018,
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Widget thirdListView() {
    return Container(
      height: 135,
      width: Get.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: text.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: Get.width * .34,
              decoration: BoxDecoration(
                  color: kConBlack, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          '${ImagePath.group}',
                          // width: 32,
                          height: 34,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          '${ImagePath.fire}',
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Voyager',
                      style: TextStyle(
                          fontSize: Get.height * .016,
                          fontWeight: FontWeight.w500,
                          color: kWhite,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${rupees[index]}',
                      style: TextStyle(
                          fontSize: Get.height * .015,
                          fontWeight: FontWeight.w400,
                          color: kGrey1,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward, color: kLightGreen, size: 17),
                        Text(
                          '${text[index]}',
                          style: TextStyle(
                              fontSize: Get.height * .018,
                              fontWeight: FontWeight.w400,
                              color: kLightGreen,
                              fontFamily: 'Roboto'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listViews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                color: Color(0xff8F7AE1),
              ))
            : GetBuilder<FavouriteController>(
                builder: (fcontroller) {
                  return Container(
                    height: 120,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: fcontroller.data2.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: Get.width * .23,
                            decoration: BoxDecoration(
                                color: kConBlack,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        color: kWhite, shape: BoxShape.circle),
                                    child: Image.asset(
                                      Images[index],
                                      width: 32,
                                      height: 32,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${fcontroller.data2[index]['name']}',
                                    style: TextStyle(
                                        fontSize: Get.height * .016,
                                        fontWeight: FontWeight.w500,
                                        color: kWhite,
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${fcontroller.data2[index]['value']}',
                                    style: TextStyle(
                                        fontSize: Get.height * .013,
                                        fontWeight: FontWeight.w400,
                                        color: kGrey1,
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_upward,
                                          color: kLightGreen, size: 14),
                                      Text(
                                        '0.01%',
                                        style: TextStyle(
                                            fontSize: Get.height * .014,
                                            fontWeight: FontWeight.w400,
                                            color: kLightGreen,
                                            fontFamily: 'Roboto'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
        commonSized(),
        Text(
          'Getting Started',
          style: TextStyle(
              fontSize: Get.height * .018,
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Row centerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Favorites',
          style: TextStyle(
              fontSize: Get.height * .018,
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontFamily: 'Roboto'),
        ),
        GestureDetector(
          onTap: () {
            Get.to(CurrencyListScreen());
          },
          child: Text(
            'Edit',
            style: TextStyle(
                fontSize: Get.height * .014,
                fontWeight: FontWeight.w400,
                color: kGrey1,
                fontFamily: 'Roboto'),
          ),
        ),
      ],
    );
  }

  SizedBox commonSized() {
    return SizedBox(
      height: 20,
    );
  }

  SizedBox sizedBoxCommon() {
    return SizedBox(
      height: 25,
    );
  }

  Container tabBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: kLightPurpal,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: kPurpal, offset: Offset(0, 1), blurRadius: 3)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              '${ImagePath.arrow}',
              width: 32,
              height: 32,
              fit: BoxFit.fill,
            ),
            Center(
              child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: kPurpal,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: kPurpal, offset: Offset(1, 1), blurRadius: 3)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          '${ImagePath.doubleArrow}',
                          width: 32,
                          height: 32,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Image.asset(
                            '${ImagePath.vertical}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Image.asset(
                          '${ImagePath.currency}',
                          width: 32,
                          height: 32,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  )),
            ),
            Image.asset(
              '${ImagePath.arrowDown}',
              width: 32,
              height: 32,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Row divider() {
    return Row(
      children: [
        Text(
          '\$64,792.59 ',
          style: TextStyle(
              fontSize: Get.height * .016,
              fontWeight: FontWeight.w500,
              color: kGrey1,
              fontFamily: 'Roboto'),
        ),
        Expanded(
          child: Divider(
            color: kPrimary,
          ),
        ),
      ],
    );
  }

  Container chartWidget() {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.90,
            child: Container(
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          /* SizedBox(
              width: 60,
              height: 34,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  'avg',
                  style: TextStyle(
                      fontSize: 12,
                      color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                ),
              ),
            ),*/
        ],
      ),
    );
  }

  Column topWidget() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$',
              style: TextStyle(
                  fontSize: Get.height * .02,
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                  fontFamily: 'Roboto'),
            ),
            Text(
              '65,784.',
              style: TextStyle(
                  fontSize: Get.height * .04,
                  fontWeight: FontWeight.w600,
                  color: kWhite,
                  fontFamily: 'Roboto'),
            ),
            Text(
              '45',
              style: TextStyle(
                  fontSize: Get.height * .02,
                  fontWeight: FontWeight.w500,
                  color: kWhite,
                  fontFamily: 'Roboto'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change ',
              style: TextStyle(
                  fontSize: Get.height * .016,
                  fontWeight: FontWeight.w500,
                  color: kGrey1,
                  fontFamily: 'Roboto'),
            ),
            Text(
              '+3.28%',
              style: TextStyle(
                  fontSize: Get.height * .016,
                  fontWeight: FontWeight.w500,
                  color: kLightGreen,
                  fontFamily: 'Roboto'),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('24H', style: style);
        break;
      case 3:
        text = const Text('7D', style: style);
        break;
      case 5:
        text = const Text('1M', style: style);
        break;
      case 7:
        text = const Text('3M', style: style);
        break;
      case 9:
        text = const Text('6M', style: style);
        break;
      case 11:
        text = const Text('1Y', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchCallback: (p0, p1) {
          // print('p0 ${p0}');
          if (!p0.isInterestedForInteractions ||
              p1 == null ||
              p1.lineBarSpots == null) {
            return;
          }
          final value1 = p1.lineBarSpots![0].y;

          print('value >> $value1');
        },
      ),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          log('getDrawingHorizontalLine VALUE >>> $value');

          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          log('getDrawingVerticalLine VALUE >>> $value');
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xff5C5F7B),
          ),
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(1.5, 4),
            FlSpot(2.6, 2),
            FlSpot(3.9, 5.5),
            FlSpot(4.9, 5.8),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors, stops: [1, 1]
              // begin: Alignment.centerLeft,
              // end: Alignment.centerRight,
              ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              stops: [0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
