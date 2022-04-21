// To parse this JSON data, do
//
//     final holidaysObj = holidaysObjFromJson(jsonString);

import 'dart:convert';

List<HolidaysObj> holidaysObjFromJson(String str) => List<HolidaysObj>.from(
    json.decode(str).map((x) => HolidaysObj.fromJson(x)));

String holidaysObjToJson(List<HolidaysObj> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HolidaysObj {
  HolidaysObj({
    this.division,
    this.events,
  });

  String? division;
  List<Event>? events;

  factory HolidaysObj.fromJson(Map<String, dynamic> json) => HolidaysObj(
        division: json["division"],
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "division": division,
        "events": List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.title,
    this.date,
    this.notes,
    this.bunting,
  });

  String? title;
  String? date;
  String? notes;
  bool? bunting;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        title: json["title"],
        date: json["date"],
        notes: json["notes"],
        bunting: json["bunting"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "notes": notes,
        "bunting": bunting,
      };
}
