// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/services.dart';

import 'iccid_retriever_platform_interface.dart';

class IccidRetriever {
  Future<String?> getPlatformVersion() {
    return IccidRetrieverPlatform.instance.getPlatformVersion();
  }

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
}
