import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

import 'dart:async';

Future<List>? uUIDScan() async {
  final flutterReactiveBle = FlutterReactiveBle();
  final devicesList = <String>{};

  final subscription = flutterReactiveBle.scanForDevices(
    withServices: [],
    scanMode: ScanMode.lowPower,
    requireLocationServicesEnabled: false,
  ).listen((scanResult) {
    devicesList.add(scanResult.id.toString());
  });

  // Wait for 4 seconds
  await Future.delayed(Duration(seconds: 4));

  // Cancel the subscription to stop scanning for devices
  await subscription.cancel();

  // Print the list of scanned devices

  return devicesList.toList();
}

Future<String>? aTTendance() async {
  List? uuid = await uUIDScan();
  List? uuidlist = uUIDList();

  for (int i = 0; i < uuid!.length; i++) {
    if (uuidlist!.contains(uuid[i])) {
      return 'Present ${uuid[i]}';
    }
  }
  return 'Absent $uuid';
}

List? uUIDList() {
  //will be replaced by an API call
  List l = ['03:01:51:C9:65:72'];
  return l;
}
