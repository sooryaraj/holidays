import 'package:bank_holidays/helpers/local_database_dao.dart';
import 'package:bank_holidays/models/holidays_obj.dart';
import 'package:bank_holidays/services/holidays_repository.dart';
import 'package:bank_holidays/utils/enums.dart';
import 'package:get/get.dart';

class HolidaysScreenController extends GetxController {
  var listHolidays = <HolidaysObj>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var selectedEventObject = Event().obs;
  var selectedDivision = "".obs;
  var dao = LocalDatabaseDao();
  Rx<RetriveState> status = RetriveState.loading.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // load data from local db
    loadHolidaysDetailsFromLocal();
  }

  // load details from server when pull down the resfresh indicator and loading first time then store in sembast
  void loadHolidaysDetailsFromServer({bool reset = true}) {
    status.value =
        RetriveState.loading; // for showing a CircularProgressIndicator()
    isLoading(true);
    try {
      HolidaysRepository().fetchHolidaysDetails().then((value) {
        listHolidays.value = value;
        if (value.isEmpty) {
          status.value = RetriveState.empty;
        } else {
          dao.insertHolidaysList(value, reset);
          status.value = RetriveState.success;
        }
      });
    } catch (e) {
      status.value = RetriveState.error;
      errorMessage.value = "Error: $e";
    }

    isLoading(false);
  }

  void loadHolidaysDetailsFromLocal() {
    status.value = RetriveState.loading;
    isLoading(true);
    try {
      dao.getHolidaysFromLocal().then((value) {
        listHolidays.value = value;
        if (value.isEmpty) {
          loadHolidaysDetailsFromServer();
        } else {
          status.value = RetriveState.success;
        }
      });
    } catch (e) {
      status.value = RetriveState.error;
      errorMessage.value = "Error: $e";
    }

    isLoading(false);
  }
}
