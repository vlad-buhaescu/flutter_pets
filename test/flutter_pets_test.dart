import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pets/flutter_pets.dart';
import 'package:flutter_pets/flutter_pets_platform_interface.dart';
import 'package:flutter_pets/flutter_pets_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPetsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPetsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPetsPlatform initialPlatform = FlutterPetsPlatform.instance;

  test('$MethodChannelFlutterPets is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPets>());
  });

  test('getPlatformVersion', () async {
    FlutterPets flutterPetsPlugin = FlutterPets();
    MockFlutterPetsPlatform fakePlatform = MockFlutterPetsPlatform();
    FlutterPetsPlatform.instance = fakePlatform;

    expect(await flutterPetsPlugin.getPlatformVersion(), '42');
  });
}
