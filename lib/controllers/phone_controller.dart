import 'package:flutter/material.dart';

class PhoneController extends ChangeNotifier {
  String _phoneNumber = "";

  String get phoneNumber => _phoneNumber;
  String get fullPhoneNumber => "$countryCode $_phoneNumber";

  String get countryCode => "966";

  void addCharacter(String character) {
    if (_phoneNumber.length < 9) {
      _phoneNumber += character;
      notifyListeners();
    }
  }

  void removeCharacter() {
    if (_phoneNumber.isNotEmpty) {
      _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
      notifyListeners();
    }
  }

  void clearNumber() {
    _phoneNumber = "";
    notifyListeners();
  }
}
