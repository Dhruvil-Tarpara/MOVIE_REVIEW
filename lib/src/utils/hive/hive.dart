import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'hive_key.dart';

class HiveHelper {
  HiveHelper._();
  static final HiveHelper hiveHelper = HiveHelper._();

  Future<Box> get instance async => box = await Hive.openBox(HiveKeys.boxName);

  late Box box;

  /// To initialize hive
  Future<Box> init() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    box = await instance;
    return box;
  }

  /// Set data in storage
  Future<void> set(String key, dynamic value) async {
    final String data = toJsonEncode(value);
    await box.put(key, data);
  }

  /// Get data from storage
  dynamic get(String key) {
    final dynamic data = box.get(key);

    return data != null ? toJsonDecode(data) : data;
  }

  /// Remove data from storage
  void remove(String key) async {
    await box.delete(key);
  }

  /// Set data in storage
  bool isContainKey(String key) {
    return box.containsKey(key);
  }

  /// clear data in storage
  Future<int> clear() async {
    return await box.clear();
  }

  /// To encode data
  String toJsonEncode(dynamic value) {
    try {
      return json.encode(value);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// To decode data
  dynamic toJsonDecode(dynamic value) {
    try {
      return json.decode(value);
    } catch (e) {
      return null;
    }
  }
}
