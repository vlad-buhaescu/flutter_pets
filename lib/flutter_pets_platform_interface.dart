import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pets_method_channel.dart';

abstract class FlutterPetsPlatform extends PlatformInterface {
  /// Constructs a FlutterPetsPlatform.
  FlutterPetsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPetsPlatform _instance = MethodChannelFlutterPets();

  /// The default instance of [FlutterPetsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPets].
  static FlutterPetsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPetsPlatform] when
  /// they register themselves.
  static set instance(FlutterPetsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
