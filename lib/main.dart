import 'package:exodus/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/bottombar_controller.dart';
import 'controller/get_history_viewmodel.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // home: BottomBar(),
    );
  }

  BottomBarController bottomBarController = Get.put(BottomBarController());
  GetHistoryViewModel getHistoryViewModel = Get.put(GetHistoryViewModel());
}
