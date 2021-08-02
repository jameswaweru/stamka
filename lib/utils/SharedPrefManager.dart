import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefManager {
  static SharedPreferences _preferences;

  static const _keyAppIsActivated = 'appIsActivated';
  static const _keyUserMobileNumber = 'msisdn';
  static const _keyUserOtp = 'otp';
  static const _keyGeneratedToken = 'generatedToken';
  static const _keyIsRegistered = 'isRegistered';
  static const _keyAgentName = 'agentName';
  static const _keyAgentBalance = 'agentBalance';
  static const _keyAgentNumber = 'agentNumber';
  static const _keyAgentId = 'keyAgentId';


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAgentName(String agentName) async =>
      await _preferences.setString(_keyAgentName, agentName);
  static String getAgentName() => _preferences.getString(_keyAgentName);

  static Future setAgentBalance(String agentBalance) async =>
      await _preferences.setString(_keyAgentBalance, agentBalance);
  static String getAgentBalance() => _preferences.getString(_keyAgentBalance);

  static Future setAgentId(String agentId) async =>
      await _preferences.setString(_keyAgentId, agentId);
  static String getAgentId() => _preferences.getString(_keyAgentId);

  static Future setIsRegistered(bool isRegistered) async =>
      await _preferences.setBool(_keyIsRegistered, isRegistered);
  static bool isRegistered() => _preferences.getBool(_keyIsRegistered);

  static Future setIsAppActivated(bool isAppActivated) async =>
      await _preferences.setBool(_keyAppIsActivated, isAppActivated);
  static bool isAppActivated() => _preferences.getBool(_keyAppIsActivated);

  static Future setUserMobileNumber(String msisdn) async =>
      await _preferences.setString(_keyUserMobileNumber, msisdn);
  static String getUserMsisdn() => _preferences.getString(_keyUserMobileNumber);

  static Future setUserOtp(String otp) async =>
      await _preferences.setString(_keyUserOtp, otp);
  static String getUserOtp() => _preferences.getString(_keyUserOtp);

  static Future setGeneratedToken(String token) async =>
      await _preferences.setString(_keyGeneratedToken, token);
  static String getGeneratedToken() => _preferences.getString(_keyGeneratedToken);

}