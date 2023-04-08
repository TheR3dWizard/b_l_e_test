import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'dart:async';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  void refreshScreen() {
    setState(() {});
  }

  String? uUIDScan() {
    final flutterReactiveBle = FlutterReactiveBle();
    var str = "No items utiuufgvwibd yet";
    var l = ["First item"];
    List<DiscoveredDevice> _foundBleUARTDevices = [];
    StreamSubscription<DiscoveredDevice> _scanStream;
    _foundBleUARTDevices = [];
    //_scanning = true;
    refreshScreen();
    _scanStream =
        flutterReactiveBle.scanForDevices(withServices: []).listen((device) {
      _foundBleUARTDevices.add(device);
      l.add("Hello");
    }, onError: (Object error) {
      return "No result";
    });

    for (var id in l) {
      str = str + id.toString();
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  uUIDScan(),
                  'Didnt Work',
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
