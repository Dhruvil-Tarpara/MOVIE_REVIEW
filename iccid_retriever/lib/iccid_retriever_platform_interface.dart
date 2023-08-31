import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'iccid_retriever_method_channel.dart';

abstract class IccidRetrieverPlatform extends PlatformInterface {
  /// Constructs a IccidRetrieverPlatform.
  IccidRetrieverPlatform() : super(token: _token);

  static final Object _token = Object();

  static IccidRetrieverPlatform _instance = MethodChannelIccidRetriever();

  /// The default instance of [IccidRetrieverPlatform] to use.
  ///
  /// Defaults to [MethodChannelIccidRetriever].
  static IccidRetrieverPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IccidRetrieverPlatform] when
  /// they register themselves.
  static set instance(IccidRetrieverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
