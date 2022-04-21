import 'package:bank_holidays/controllers/holidays_screen_controller.dart';
import 'package:bank_holidays/models/holidays_obj.dart';
import 'package:bank_holidays/utils/constant.dart';
import 'package:bank_holidays/utils/enums.dart';
import 'package:bank_holidays/utils/extensions.dart';
import 'package:bank_holidays/utils/route_paths.dart' as routes;
import 'package:bank_holidays/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final HolidaysScreenController _holidaysScreenController =
    Get.find<HolidaysScreenController>();

class HolidaysScreen extends StatelessWidget {
  const HolidaysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Holidays"),
            centerTitle: true,
          ),
          body: const HolidayListView(),
        ));
  }
}

class HolidayListView extends StatefulWidget {
  const HolidayListView({Key? key}) : super(key: key);

  @override
  _HolidayListViewState createState() => _HolidayListViewState();
}

class _HolidayListViewState extends State<HolidayListView> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<HolidaysObj> _holidaysData = _holidaysScreenController.listHolidays;
      if (_holidaysScreenController.status.value == RetriveState.success) {
        return RefreshIndicator(
          displacement: 50,
          backgroundColor: Const.primaryColor,
          color: Colors.white,
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            // pull down for refresh all data /// NOTE:: this will reload all data from server
            _holidaysScreenController.loadHolidaysDetailsFromServer();
          },
          child: ListView.builder(
            itemCount: _holidaysData.length,
            itemBuilder: (context, divisionIndex) {
              return ExpansionTile(
                title: GestureDetector(
                  onTap: () {
                    /// store division in variable for showing in next screen
                    _holidaysScreenController.selectedDivision.value =
                        _holidaysData[divisionIndex].division ?? "";
                  },
                  child: Text(
                    _holidaysData[divisionIndex].division?.toTitleCase() ?? "",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                children: <Widget>[
                  Column(
                    children: [
                      LimitedBox(
                        maxHeight: Get.height,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 125),
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              _holidaysData[divisionIndex].events?.length ?? 0,
                          itemBuilder: (BuildContext context, int eventIndex) {
                            var _data = _holidaysData[divisionIndex]
                                .events![eventIndex];

                            /// event object
                            return GestureDetector(
                              onTap: () {
                                /// store data in variable for showing in next screen
                                _holidaysScreenController
                                    .selectedEventObject.value = _data;
                                Get.toNamed(routes.holidayDetailsScreen);
                              },
                              child: ListTile(
                                title: Text(_data.date ?? ""),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      } else if (_holidaysScreenController.status.value == RetriveState.error) {
        return Text(_holidaysScreenController.errorMessage.value);
      } else if (_holidaysScreenController.status.value == RetriveState.empty) {
        return Utils.emptyWidget(
            title:
                "No Holidays Available"); // custom widget for show a empty message
      } else {
        return Utils.loader();

        /// CircularProgressIndicator()
      }
    });
  }
}

class HolidaysExpandedTile extends StatelessWidget {
  const HolidaysExpandedTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HolidaysListTile extends StatelessWidget {
  const HolidaysListTile({Key? key, required this.data}) : super(key: key);
  final HolidaysObj data;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
