import 'package:bank_holidays/controllers/holidays_screen_controller.dart';
import 'package:bank_holidays/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final HolidaysScreenController _holidaysScreenController =
    Get.find<HolidaysScreenController>();

/// find Getx instance

class HolidayDetailsScreen extends StatelessWidget {
  const HolidayDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Details"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*
                TODO:: children structure looks like below comment
                Division Name
                |
                |
                Event Date
                |
                Event Name
                |
                Event Note
                 */
                Text(
                  _holidaysScreenController.selectedDivision.value
                          .toTitleCase() ??
                      "",
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  _holidaysScreenController.selectedEventObject.value.date ??
                      "",
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _holidaysScreenController.selectedEventObject.value.title
                          ?.toTitleCase() ??
                      "",
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _holidaysScreenController.selectedEventObject.value.notes
                          ?.toTitleCase() ??
                      "",
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ));
  }
}
