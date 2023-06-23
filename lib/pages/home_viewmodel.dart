import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class TodoHomeViewModel extends BaseViewModel {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  set date(DateTime date) {}
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  DateTime _selectedDate = DateTime.now();
  DateTime modalCurrentDate = DateTime.now();
  modalDate() {
    modalCurrentDate = _selectedDate;
  }

  // onDaySelected(DateTime day, DateTime focusedDay) {
  //   modalCurrentDate = day;
  //   _selectedDate = day;
  //   notifyListeners();
  // }
}
