import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

// String? uUIDScan() {
//   final flutterReactiveBle = FlutterReactiveBle();
//   var str = "";

//   List<DiscoveredDevice> _foundBleUARTDevices = [];
//   StreamSubscription<DiscoveredDevice> _scanStream;
//   _foundBleUARTDevices = [];
//   //_scanning = true;
//   refreshScreen();
//   _scanStream =
//       flutterReactiveBle.scanForDevices(withServices: []).listen((device) {
//     _foundBleUARTDevices.add(device);
//   }, onError: (Object error) {});
//   for (var id in _foundBleUARTDevices) {
//     str = str + id.toString();
//   }
//   return str;
// }

