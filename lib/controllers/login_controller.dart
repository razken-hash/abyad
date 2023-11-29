import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool login({required String username, required String password}) {
    return username == "admin" && password == "12345678";
  }
}
