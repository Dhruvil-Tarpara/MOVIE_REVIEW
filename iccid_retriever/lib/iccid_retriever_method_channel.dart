import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'iccid_retriever_platform_interface.dart';

/// An implementation of [IccidRetrieverPlatform] that uses method channels.
class MethodChannelIccidRetriever extends IccidRetrieverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('iccid_retriever');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
