import 'package:bank_holidays/screens/holiday_details_screen.dart';
import 'package:bank_holidays/screens/holidays_screen.dart';
import 'package:bank_holidays/utils/route_paths.dart' as routes;
import 'package:get/get.dart';

var generateRoute = [
  GetPage(
    name: routes.holidayScreen,
    page: () => const HolidaysScreen(),
  ),
  GetPage(
      name: routes.holidayDetailsScreen,
      page: () => const HolidayDetailsScreen()),
];
