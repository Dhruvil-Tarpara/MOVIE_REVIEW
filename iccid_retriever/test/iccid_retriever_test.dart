import 'package:flutter_test/flutter_test.dart';
import 'package:iccid_retriever/iccid_retriever.dart';
import 'package:iccid_retriever/iccid_retriever_platform_interface.dart';
import 'package:iccid_retriever/iccid_retriever_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIccidRetrieverPlatform
    with MockPlatformInterfaceMixin
    implements IccidRetrieverPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IccidRetrieverPlatform initialPlatform = IccidRetrieverPlatform.instance;

  test('$MethodChannelIccidRetriever is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIccidRetriever>());
  });

  test('getPlatformVersion', () async {
    IccidRetriever iccidRetrieverPlugin = IccidRetriever();
    MockIccidRetrieverPlatform fakePlatform = MockIccidRetrieverPlatform();
    IccidRetrieverPlatform.instance = fakePlatform;

    expect(await iccidRetrieverPlugin.getPlatformVersion(), '42');
  });
}
