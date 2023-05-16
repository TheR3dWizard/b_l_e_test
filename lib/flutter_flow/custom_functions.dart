import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:async';

Future<List>? uUIDScan() async {
  final flutterReactiveBle = FlutterReactiveBle();
  final devicesList = <String>{};

  final subscription = flutterReactiveBle.scanForDevices(
    withServices: [],
    scanMode: ScanMode.lowLatency,
    requireLocationServicesEnabled: false,
  ).listen((scanResult) {
    devicesList.add(scanResult.id.toString());
    print(scanResult.id.toString() + "," + scanResult.rssi.toString());
  });

  // Wait for 4 seconds
  await Future.delayed(Duration(seconds: 4));

  // Cancel the subscription to stop scanning for devices
  await subscription.cancel();

  // Print the list of scanned devices

  return devicesList.toList();
}

Future<String>? aTTendance() async {
  String perms = await pErmissions()!;
  List? uuid = await uUIDScan();
  List? uuidlist = uUIDList();

  if (perms == 'False') {
    return 'Permissions not granted';
  }
  for (int i = 0; i < uuid!.length; i++) {
    if (uuidlist!.contains(uuid[i])) {
      return 'Present ${uuid[i]}';
    }
  }
  return 'Absent $uuid';
}

List? uUIDList() {
  //will be replaced by an API call
  List l = ['68:8D:FC:A9:CD:92', '52:52:99:19:D6:28'];
  return l;
}

Future<String>? pErmissions() async {
  //check permissions for bluetooth and location
  var statusBLS = await Permission.bluetoothScan.request();
  var statusLoc = await Permission.location.request();
  var statusBLC = await Permission.bluetoothConnect.request();
  if (statusLoc == PermissionStatus.granted &&
      statusBLS == PermissionStatus.granted &&
      statusBLC == PermissionStatus.granted) {
    return 'True';
  } else {
    return 'False';
  }
}

// import 'dart:convert';
// import 'dart:math' as math;
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'lat_lng.dart';
// import 'place.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'dart:async';

// Future<List>? uUIDScan() async {
//   final flutterReactiveBle = FlutterReactiveBle();
//   final devicesList = <String>{};

//   final subscription = flutterReactiveBle.scanForDevices(
//     withServices: [],
//     scanMode: ScanMode.lowLatency,
//     requireLocationServicesEnabled: false,
//   ).listen((scanResult) {
//     List l = [];
//     l.add(scanResult.id.toString());
//     for (int i = 0; i < scanResult.serviceUuids.length; i++) {
//       l.add(scanResult.serviceUuids[i].toString());
//       print(
//           "Device: ${scanResult.id} \n Name: ${scanResult.serviceData} \n rssi: ${scanResult.rssi} \n ServiceUUIDs : ${scanResult.serviceUuids}");
//       String s = "";
//       s = s + l[0] + l[1] + "\n";
//       devicesList.add(s);
//     }
//   });

//   // Wait for 4 seconds
//   await Future.delayed(Duration(seconds: 30));

//   // Cancel the subscription to stop scanning for devices
//   await subscription.cancel();

//   // Print the list of scanned devices

//   return devicesList.toList();
// }

// Future<String>? aTTendance() async {
//   String perms = await pErmissions()!;
//   List? uuid = await uUIDScan();
//   List? uuidlist = uUIDList();
//   print(uuid);

//   if (perms == 'False') {
//     return 'Permissions not granted';
//   }
//   for (int i = 0; i < uuid!.length; i++) {
//     if (uuidlist!.contains(uuid[i])) {
//       return 'Present ${uuid[i]}';
//     }
//   }
//   return 'Absent $uuid';
// }

// List? uUIDList() {
//   //will be replaced by an API call
//   List l = ['2f234454-cf6d-4a0f-adf2-f4911ba9ffa6'];
//   return l;
// }

// Future<String>? pErmissions() async {
//   //check permissions for bluetooth and location
//   var statusBLS = await Permission.bluetoothScan.request();
//   var statusLoc = await Permission.location.request();
//   var statusBLC = await Permission.bluetoothConnect.request();
//   if (statusLoc == PermissionStatus.granted &&
//       statusBLS == PermissionStatus.granted &&
//       statusBLC == PermissionStatus.granted) {
//     return 'True';
//   } else {
//     return 'False';
//   }
// }
