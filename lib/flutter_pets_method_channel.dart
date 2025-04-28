import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pets_platform_interface.dart';

class MethodChannelFlutterPets extends FlutterPetsPlatform {

  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pets_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
