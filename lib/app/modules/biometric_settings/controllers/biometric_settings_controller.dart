import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricSettingsController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;
  List listOfListTileTitles = [
    {
      'title': 'Biometric Login',
      'sub_title':
          'Lorem ipsum dolor sit amet consectetur. Sagittis mattis quis interdum morbi amet semper ut eget.',
      'check': true,
    },
    {
      'title': 'Biometric Method',
      'sub_title': 'Lorem ipsum dolor sit amet consectetur. ',
      'check': true,
    }
  ];
  final _auth = LocalAuthentication();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnListTile({required int index}) async {
    await authenticate();
  }

  Future<bool> hasBiometrics() async {
    final isAvailable = await _auth.canCheckBiometrics;
    final isDeviceSupported = await _auth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  Future<bool> authenticate() async {
    final isAuthAvailable = await hasBiometrics();
    if (!isAuthAvailable) return false;
    try {
      return await _auth.authenticate(
          localizedReason: 'Touch your finger on the sensor to login');
    } catch (e) {
      return false;
    }
  }
}
