import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  Future<String?> fetchTheme() async {
    //cari di shared data ada ga prefs untuk dark or light theme trus toggle !
    try {
      final prefs = await SharedPreferences.getInstance();

      if (prefs.getString('theme') == null) {
        prefs.setString('theme', 'light');
      }

      return prefs.getString('theme');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print((prefs.getString('theme') == 'light'));
      if (prefs.getString('theme') == 'light') {
        prefs.setString('theme', 'dark');
      } else {
        prefs.setString('theme', 'light');
      }
    } catch (e) {
      rethrow;
    }
  }
}
