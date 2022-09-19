import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Beacon {
  Beacon(
      {required this.beaconId,
      this.email = '',
      this.name = '',
      this.attributes});

  final String beaconId;
  final String email;
  final String name;
  final Map<String, String>? attributes;
  static const MethodChannel _channel = const MethodChannel('help_scout');

  static bool get available =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  Future<void> init() async {
    await _channel.invokeMethod('setupBeacon', {
      "beacon": beaconId,
      "email": email,
      "name": name,
      "attributes": attributes
    });
  }

  Future<void> open({String? signature}) async {
    await _channel.invokeMethod(
        'openBeacon', {"beacon": beaconId, "signature": signature});
  }
}
