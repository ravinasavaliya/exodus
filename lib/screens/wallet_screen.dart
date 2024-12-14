import 'package:exodus/controller/get_amount_viewmodel.dart';
import 'package:exodus/screens/balance_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apiModel/api_services/api_services/api_response.dart';
import '../apiModel/model/responseModel/get_amount_res_model.dart';
import '../common/color.dart';
import '../common/common_sizedbox.dart';
import '../common/images.dart';

List VehicleType = ["Two Wheeler", "Four Wheeler"];

class WalletScreen extends StatefulWidget {
  final ScrollController? scrollController;
  const WalletScreen({Key? key, this.scrollController}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  GetAmountViewModel _getAmountViewModel = Get.put(GetAmountViewModel());
  bool isTap = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0.0, 0.0),
    end: const Offset(0.0, -0.9),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.fastLinearToSlowEaseIn,
  ));

  @override
  initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationController!.addListener(() => setState(() {}));

    TickerFuture tickerFuture = animationController!.repeat(reverse: true);
    _getAmountViewModel.getAmountViewModel();
    super.initState();
  }

  String VehicleTypeValue = VehicleType.first;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    _controller.dispose();
    super.dispose();
  }

  // List listData = [
  //   {
  //     "icon": "${ImagePath.w_bitCoin}",
  //     "currency": "BTC",
  //     "c_name": "BitCoin",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   },
  //   {
  //     "icon": "${ImagePath.w_ETH}",
  //     "currency": "ETH",
  //     "c_name": "Ethereum",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   },
  //   {
  //     "icon": "${ImagePath.w_SOLONA}",
  //     "currency": "SOLONA",
  //     "c_name": "BitCoin",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   },
  //   {
  //     "icon": "${ImagePath.w_ALGO}",
  //     "currency": "ALGO",
  //     "c_name": "Algorand",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   },
  //   {
  //     "icon": "${ImagePath.w_ATOM}",
  //     "currency": "ATOM",
  //     "c_name": "Cosmos",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   },
  //   {
  //     "icon": "${ImagePath.w_XTZ}",
  //     "currency": "XTZ",
  //     "c_name": "Tezos",
  //     "amount": "\$19,546.54",
  //     "count": "0",
  //     "percentage": "+2.84%"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    _controller.isAnimating ? _controller.stop() : _controller.forward();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kThemeGradient, kThemeDark],
              begin: Alignment.topCenter,
              end: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            controller: widget.scrollController,
            children: [
              CommonSizeBox.commonSizeBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.to(HomePage());
                    },
                    child: Image.asset(
                      "${ImagePath.w_search}",
                      height: Get.height * 0.05,
                      width: Get.width * 0.05,
                    ),
                  )
                ],
              ),
              CommonSizeBox.commonSizeBox(height: Get.height * 0.03),

              /// circle

              GetBuilder<GetAmountViewModel>(
                builder: (controller) {
                  if (controller.apiResponse.status == Status.LOADING) {
                    return Text(
                      'Loading..',
                      style: TextStyle(
                          color: kW_Circle.withOpacity(0.3),
                          fontSize: Get.height * .01),
                    );
                  }
                  if (controller.apiResponse.status == Status.ERROR) {
                    return SizedBox();
                  }

                  GetAmontResModel response = controller.apiResponse.data;
                  print('BALANCE===${response.data?.balance}');
                  String? amountLast =
                      response.data?.balance!.split('.').last.toString();
                  String? amount =
                      response.data?.balance!.split('.').first.toString();
                  return Center(
                    child: GestureDetector(
                      onPanStart: (DragStartDetails val) {
                        print('starting....');
                        setState(() {
                          isTap = true;
                        });
                      },
                      onPanEnd: (DragEndDetails val) {
                        print('ending....');
                        setState(() {
                          isTap = false;
                        });
                      },
                      onPanUpdate: (DragUpdateDetails val) {
                        print('updating....');
                        setState(() {
                          isTap = true;
                        });
                      },
                      onTap: () {
                        setState(() {
                          isTap = true;
                        });
                        Future.delayed(Duration(milliseconds: 500), () {
                          Get.to(BalanceDetailScreen(
                            amount: response.data!.balance!,
                          ));
                          setState(() {
                            isTap = false;
                          });
                        });
                      },
                      child: Container(
                          width: Get.width * 0.5,
                          height: Get.height * 0.25,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: isTap == false
                                    ? kYellow
                                    : kW_Circle.withOpacity(0.7),
                                width: 2),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\€',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: Get.height * .023,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${amount ?? ''}.',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: Get.height * .033,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${amountLast}',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: Get.height * .023,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
              CommonSizeBox.commonSizeBox(height: Get.height * 0.03),

              /// dropDownButton
              Container(
                // color: Colors.red,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.045,
                        width: Get.width * 0.045,
                        child: Image.asset(
                          "${ImagePath.w_dropDownIcon}",
                          height: Get.height * 0.035,
                          width: Get.width * 0.035,
                        ),
                      ),
                      Text(
                        "  PORTFOLIO VALUE",
                        style: TextStyle(
                            color: kGrey1,
                            fontWeight: FontWeight.w600,
                            fontSize: Get.height * 0.019),
                      ),
                    ]),
              )
              // DropdownButton(
              //   items: VehicleType.map((value) {
              //     return DropdownMenuItem(
              //       value: value,
              //       child:""
              //           // SizedBox()
              //           // Center(child: Text("${value}")),
              //     );
              //   }).toList(),
              //
              //   // iconSize: Get.height * 0.03,
              //   // menuMaxHeight: 10,
              //   icon: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Container(
              //           height: Get.height * 0.045,
              //           width: Get.width * 0.045,
              //           child: Image.asset(
              //             "${ImagePath.w_dropDownIcon}",
              //             height: Get.height * 0.035,
              //             width: Get.width * 0.035,
              //           ),
              //         ),
              //         Text(
              //           "  PORTFOLIO VALUE",
              //           style: TextStyle(
              //               color: kGrey1,
              //               fontWeight: FontWeight.w600,
              //               fontSize: Get.height * 0.019),
              //         ),
              //       ]),
              //
              //   underline: SizedBox(),
              //   alignment: Alignment.center,
              //   isDense: true,
              //   autofocus: true,
              //
              //   dropdownColor: kGrey1,
              //   onChanged: (value) {
              //     setState(() {
              //       VehicleTypeValue = value as String;
              //     });
              //   },
              // ),
              ,
              CommonSizeBox.commonSizeBox(height: Get.height * 0.02),

              /// Backup Your Wallet
              Image.asset("${ImagePath.w_backUpWallet}"),
              CommonSizeBox.commonSizeBox(height: Get.height * 0.01),

              ///BTC
              currencyContainer(
                  image: "${ImagePath.w_bitCoin}",
                  currency: "BTC",
                  c_name: "Tezos",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),

              ///ETH
              currencyContainer(
                  image: "${ImagePath.w_ETH}",
                  currency: "ETH",
                  c_name: "Ethereum",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),

              ///SOLONA
              currencyContainer(
                  image: "${ImagePath.w_SOLONA}",
                  currency: "SOLONA",
                  c_name: "BitCoin",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),

              ///ALGo
              currencyContainer(
                  image: "${ImagePath.w_ALGO}",
                  currency: "ALGO",
                  c_name: "Algorand",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),

              ///ATOM
              currencyContainer(
                  image: "${ImagePath.w_ATOM}",
                  currency: "ATOM",
                  c_name: "Cosmos",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),

              ///XTZ
              currencyContainer(
                  image: "${ImagePath.w_XTZ}",
                  currency: "XTZ",
                  c_name: "Tezos",
                  amount: "\$19,546.54",
                  count: "0",
                  percentage: "+2.84%"),
              CommonSizeBox.commonSizeBox(height: Get.height * 0.025),

              Container(
                height: Get.height * 0.1,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${ImagePath.w_dote_button}",
                        ),
                        fit: BoxFit.contain),

                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(13)),
                child: Center(
                    child: Text(
                  "Add More",
                  style: TextStyle(
                      color: kGreyLight,
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w600),
                )),
              ),
              CommonSizeBox.commonSizeBox(
                height: Get.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding currencyContainer(
      {String? image,
      String? currency,
      String? c_name,
      String? amount,
      String? count,
      String? percentage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: Get.height * 0.145,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.00)),
            color: kConBlack,
          ),
          child: Stack(
            children: [
              Positioned(
                  height: Get.height * 0.48,
                  child: Center(
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width,
                      child: Stack(
                        children: [
                          SlideTransition(
                            position: _offsetAnimation,
                            child: Image.asset("${ImagePath.w_graph}",
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    ),
                  )),
              Column(
                children: [
                  CommonSizeBox.commonSizeBox(height: Get.height * 0.005),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20, top: 6),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          // color: Colors.red,
                          child: Image.asset(
                            image!,
                            // width: Get.width * 0.1,
                            // height: Get.height * 0.1,
                          ),
                        ),
                        CommonSizeBox.commonSizeBox(width: Get.width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonSizeBox.commonSizeBox(
                                height: Get.height * 0.012),
                            Text(
                              currency!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kWhite,
                                  fontSize: Get.height * 0.025),
                            ),
                            CommonSizeBox.commonSizeBox(
                                height: Get.height * 0.005),
                            Text(
                              c_name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: kSkyDark,
                                  fontSize: Get.height * 0.0158),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          count!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kWhite,
                              fontSize: Get.height * 0.022),
                        )
                      ],
                    ),
                  ),
                  CommonSizeBox.commonSizeBox(height: Get.height * 0.005),
                  Divider(
                    color: kSkyDark,
                    indent: Get.width * 0.215,
                  ),
                  CommonSizeBox.commonSizeBox(height: Get.height * 0.005),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: Row(
                      children: [
                        CommonSizeBox.commonSizeBox(width: Get.width * 0.17),
                        Text(
                          amount!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kWhite,
                              fontSize: Get.height * 0.017),
                        ),
                        CommonSizeBox.commonSizeBox(width: Get.width * 0.05),
                        Spacer(),
                        Text(
                          percentage!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kGreen,
                              fontSize: Get.height * 0.017),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
