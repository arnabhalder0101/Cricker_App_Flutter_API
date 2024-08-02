import 'package:cricker_app/themes/themeModes.dart';
import 'package:flutter/material.dart';

class ThemeDataProvider extends ChangeNotifier {
  ThemeData theme = lightMode;

  ThemeData get getTheme => theme;

  void setTheme(ThemeData newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  bool get isdark => (theme == darkMode);

  void toggleTheme() {
    if (theme == lightMode) {
      setTheme(darkMode);
    } else {
      setTheme(lightMode);
    }
  }
}
