import 'package:hidoc/core/services/device_service.dart';
import 'package:hidoc/data/local/prefrences.dart';
import 'package:hidoc/data/local/secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class StorageService {
  final Preferences _preferences;
  final SecureStorage _secureStorage;
  final DeviceService _deviceService;

  StorageService(this._preferences, this._secureStorage, this._deviceService);


  static const deviceToken = "deviceToken";
  static const authToken = "authToken";
  static const username = "username";
  static const name = "name";
  static const phoneNumber = "phoneNumber";
  static const companyLogo = "companyLogo";
  static const companyName = "companyName";
  static const customerId = "getCustomerId";
  static const accountNumber = "accountNumber";
  static const agentCode = "agentCode";
  static const agentBrCode = "agentBrCode";
  static const loginStatus = "loginStatus";
  static const generatePin = "generatePin";
  static const inactivity = "inactivity";
  static const preliminaryDetail = "PreliminaryDetail";
  static const bioAuth = "bioAuth";
  static const drawerDetail = "drawerDetail";

  Future clearAll() async {
    _preferences.clearAll();
    await _secureStorage.clearAll();
  }

  Future<String> getDeviceId() async => _deviceService.getDeviceId();

  Future setDeviceId(String value) async {
    await _secureStorage.secureSet(deviceToken, value);
  }

  Future<String> getUserName() async =>
      await _secureStorage.secureGet(username);

  Future<String> getName() async =>
      await _secureStorage.secureGet(name);

  Future<String> getPhoneNumber() async =>
      await _secureStorage.secureGet(phoneNumber);

  Future setUserName(String value) async {
    await _secureStorage.secureSet(username, value);
  }

  Future setName(String value) async {
    await _secureStorage.secureSet(name, value);
  }

  Future setPhoneNumber(String value) async {
    await _secureStorage.secureSet(phoneNumber, value);
  }

  Future<String> getCompanyLogo() async =>
      await _preferences.getString(companyLogo);

  Future setCompanyLogo(String value) async {
    await _preferences.setString(companyLogo, value);
  }

  Future<String> getCompanyName() async =>
      await _secureStorage.secureGet(companyName);
  
  Future setCompanyName(String value) async {
    await _secureStorage.secureSet(companyName, value);
  }

  Future<bool> getLoginStatus() async =>
      await _preferences.getBool(loginStatus);

  Future setLoginStatus(bool value) async =>
      await _preferences.setBool(loginStatus, value);

}