import 'package:bank_holidays/helpers/api_provider.dart';
import 'package:bank_holidays/models/holidays_obj.dart';

class HolidaysRepository extends ApiProvider {
  Future<List<HolidaysObj>> fetchHolidaysDetails() async {
    List jsonResult = [];
    final Map<dynamic, dynamic> response = await get(
        path: 'bank-holidays.json'); // geting response from ApiProvider class
    response.forEach((key, value) => jsonResult.add(value));
    return jsonResult.map((job) => HolidaysObj.fromJson(job)).toList();
  }
}
