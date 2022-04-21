import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static Widget loader() {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 40.0,
        width: 40.0,
      ),
    );
  }

  static Widget emptyWidget({required String title}) {
    return Center(
        child: Text(
      title,
      style: const TextStyle(
          color: Colors.black12, fontSize: 30, fontWeight: FontWeight.bold),
    ));
  }
}
