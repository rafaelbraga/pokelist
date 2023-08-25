import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  // TODO: REMOVE
  static const String onlyUser = "ASH";
  static const String password = "pikachu";

  Future<void> verifyLogin(String user, String password) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    if (user.toUpperCase() == onlyUser && password == password) {
      isLogged = true;
    }
    notifyListeners();
    isLoading = false;
  }
}
