import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AppthemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
