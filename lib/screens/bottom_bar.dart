import 'package:exodus/controller/bottombar_controller.dart';
import 'package:exodus/screens/profile_screen.dart';
import 'package:exodus/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';

import '../common/images.dart';
import 'buy_crypto_screen.dart';
import 'exchange_csreen.dart';
import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  BottomBarController bottomBarController = Get.put(BottomBarController());
  final controller = ScrollController();
  List bottomIcon = [
    IconPath.bottomIcon1,
    IconPath.bottomIcon2,
    IconPath.bottomIcon3,
    IconPath.bottomIcon4,
    IconPath.bottomIcon5,
  ];
  List bottomColorIcon = [
    ImagePath.logo,
    IconPath.bottomColorIcon2,
    IconPath.bottomColorIcon3,
    IconPath.bottomColorIcon4,
    IconPath.bottomColorIcon5,
  ];
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  // @override
  // initState() {
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 2),
  //     vsync: this,
  //   )..repeat(reverse: true);
  //   _offsetAnimation = Tween<Offset>(
  //     begin: const Offset(0.0, 3.0),
  //     end: Offset.zero,
  //   ).animate(CurvedAnimation(
  //     parent: _controller!,
  //     curve: Curves.ease,
  //   ));
  //
  //   _controller!.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //
  //   _controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // _controller!.isCompleted ? _controller!.stop() : _controller!.forward();
    return WillPopScope(
      onWillPop: () async {
        // Get.off(SplashScreen())!.then((value) => Get.back());

        SystemNavigator.pop().then((value) => Get.back());
        return false;
      },
      child: Scaffold(
        body: GetBuilder<BottomBarController>(
          builder: (bController) {
            return Stack(
              children: [
                bController.pageIndex == 0
                    ? HomeScreen(
                        scrollController: scrollController,
                      )
                    : bController.pageIndex == 1
                        ? WalletScreen(
                            scrollController: scrollController,
                          )
                        : bController.pageIndex == 2
                            ? ExchangeScreen(
                                scrollController: scrollController,
                              )
                            : bController.pageIndex == 3
                                ? BuyCryptoScreen()
                                : ProfileScreen(),
                bController.removeBottomBar == true
                    ? SizedBox()
                    : Positioned(
                        bottom: Get.height * 0.03,
                        left: Get.width * 0.08,
                        right: Get.width * 0.08,
                        child: Hidable(
                            controller: scrollController,
                            wOpacity: true,
                            preferredWidgetSize: Size.fromHeight(
                                Get.height * 0.075), // As default it's true
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff3E4356).withOpacity(0.9),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -10,
                                    bottom: -10,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: Container(
                                        height: Get.height * 0.09,
                                        child: Image.asset(
                                          IconPath.centerIcon,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.05),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              bottomIcon.length,
                                              (index) => Center(
                                                      child: GestureDetector(
                                                    onTap: () {
                                                      bController
                                                          .changePage(index);
                                                      if (index == 3) {
                                                        bController
                                                            .setRemoveBottombar(
                                                                true);
                                                      }
                                                    },
                                                    child: index == 0
                                                        ? bController
                                                                    .pageIndex ==
                                                                index
                                                            ? Image.asset(
                                                                bottomColorIcon[
                                                                    0],
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                                width:
                                                                    Get.height *
                                                                        0.03,
                                                              )
                                                            : SvgPicture.asset(
                                                                bottomIcon[0],
                                                                height:
                                                                    Get.height *
                                                                        0.03,
                                                                width:
                                                                    Get.height *
                                                                        0.03,
                                                              )
                                                        : SvgPicture.asset(
                                                            bController.pageIndex ==
                                                                    index
                                                                ? bottomColorIcon[
                                                                    index]
                                                                : bottomIcon[
                                                                    index],
                                                            height: Get.height *
                                                                0.03,
                                                            width: Get.height *
                                                                0.03,
                                                          ),
                                                  ))),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget? page1() {
    print('page 1>>>>>>>>>>>>>>>>>>>');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.separated(
        /// scrollController should be given here, to scrollable widget.
        /// and same controller must to be given hidable.
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (_, i) => _ListItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }

  Widget? page2() {
    print('page 2>>>>>>>>>>>>>>>>>>>');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.separated(
        /// scrollController should be given here, to scrollable widget.
        /// and same controller must to be given hidable.
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (_, i) => _ListItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }

  Widget? page3() {
    print('page 3>>>>>>>>>>>>>>>>>>>');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.separated(
        /// scrollController should be given here, to scrollable widget.
        /// and same controller must to be given hidable.
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (_, i) => _ListItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }

  Widget? page4() {
    print('page 4>>>>>>>>>>>>>>>>>>>');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.separated(
        /// scrollController should be given here, to scrollable widget.
        /// and same controller must to be given hidable.
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (_, i) => _ListItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }

  Widget? page5() {
    print('page 5>>>>>>>>>>>>>>>>>>>');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.separated(
        /// scrollController should be given here, to scrollable widget.
        /// and same controller must to be given hidable.
        controller: scrollController,
        itemCount: 15,
        itemBuilder: (_, i) => _ListItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(.4),
        ),
      ),
      title: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.5),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      subtitle: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.3),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
