import 'package:bank_holidays/controllers/holidays_screen_controller.dart';
import 'package:bank_holidays/helpers/data_base.dart';
import 'package:bank_holidays/utils/route_paths.dart' as routes;
import 'package:bank_holidays/utils/router.dart' as router;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  initController();

  /// init of Getx controller and database
}

void initController() {
  Get.isLogEnable = false;
  AppDatabase.instance.database;
  Get.put(HolidaysScreenController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Holidays',
      theme: ThemeData(
          backgroundColor: Colors.grey[800],
          primarySwatch: Colors.blueGrey,
          // NOTE:: pageTransitionsTheme used for reducing navigation pop delay time, here am using default PageTransitions.
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            },
          )),
      initialRoute: routes.holidayScreen,
      getPages: router.generateRoute,
      debugShowCheckedModeBanner: kDebugMode,
    );
  }
}
