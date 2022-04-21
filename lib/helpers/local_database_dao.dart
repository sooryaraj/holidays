import 'package:bank_holidays/helpers/data_base.dart';
import 'package:bank_holidays/models/holidays_obj.dart';
import 'package:bank_holidays/utils/constant.dart';
import 'package:sembast/sembast.dart';

class LocalDatabaseDao {
  final _holidaysPrefFolder =
      intMapStoreFactory.store(Const.holidaysPrefFolderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  ///// INSERT BEGIN
  Future insertHolidaysList(List<HolidaysObj> value,
      [bool reset = true]) async {
    if (reset) deleteHolidays();
    return await Future.wait([
      for (var element in value)
        _holidaysPrefFolder.add(await _db, element.toJson()),
    ]);
  }

  ///// INSERT END
  //
  ///// SELECT BEGIN
  Future<List<HolidaysObj>> getHolidaysFromLocal() async {
// Using a regular expression matching the exact word (no case)
    var recordSnapshot = await _holidaysPrefFolder.find(await _db);
    var recordList = recordSnapshot.map((snapshot) {
      final data = HolidaysObj.fromJson(snapshot.value);
      return data;
    }).toList();
    return recordList;
  }

  ///// SELECT END
  //
  ///// DELETE BEGIN
  Future<int> deleteHolidays() async =>
      await _holidaysPrefFolder.delete(await _db);
  ///// DELETE END
}
