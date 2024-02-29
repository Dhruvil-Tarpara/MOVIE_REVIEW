// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:permission_handler/permission_handler.dart';
// import 'package:movie_review/src/utils/flutter_telephony.dart';
// import 'package:sim_data/sim_data.dart';

// import 'package:telephony/telephony.dart';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:permission_handler/permission_handler.dart';

// Future<void> getSimIccId() async {
//   try {
//     await Permission.phone.status;

//     await Permission.phone.request().isGranted;
//     SimData simData = await SimDataPlugin.getSimData();

//     for (var s in simData.cards) {
//       print('Serial number:---- ${s.serialNumber}');
//       print('====================================');
//       print('Serial number:---- ${s}');
//       print('====================================');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// void printSimCardsData() async {
//   try {
//     SimData simData = await SimDataPlugin.getSimData();

//     for (var s in simData.cards) {
//       print('Serial number:---- ${s.serialNumber}');
//     }
//   } on PlatformException catch (e) {
//     debugPrint("error! code: ${e.code} - message: ${e.message}");
//   }
// }

// Future<void> getSimInfo() async {
//   try {
//     final Telephony telephony = Telephony.instance;
//     final subscriptionInfoList = await telephony;
//   } catch (e) {
//     print('Error getting SIM ICCID: $e');
//   }
// }

// getData() async {
//   try {
//     await Permission.phone.status;
//     await Permission.phone.request().isGranted;
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     final androidInfo = await deviceInfo.androidInfo;
//     // final demo = await deviceInfox.getSimInfo();
//     // String? iccid = data!.simInfo?.sims.first.serialNumberIccid;
//     // demo.sims.first
//     final alldata = androidInfo.data;

//     FlutterTelephony info = await FlutterTelephonyInfo.get(androidInfo.model);

//     print(info.simSerialNumber);
//     print('====================================');
//     print(alldata);
//     print('====================================');
//   } on PlatformException catch (e) {
//     debugPrint("${e.code} ${e.message}");
//   }
// }

import 'package:flutter/services.dart';

Future<String?> getIccId() async {
  const MethodChannel channel = MethodChannel('iccid_retriever');

  try {
    final String? iccId = await channel.invokeMethod('getIccId');
    print('====================================');
    print(iccId);
  } catch (e) {
    print('Error getting ICCID: $e');
    return null;
  }
  return null;
}
