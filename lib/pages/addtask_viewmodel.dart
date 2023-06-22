import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AddTaskViewModel extends BaseViewModel {
  final TextEditingController textEditingControllertitle =
      TextEditingController();

  final TextEditingController textEditingControllernote =
      TextEditingController();

  final TextEditingController setschedule = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  DateTime modalCurrentDate = DateTime.now();
  modalDate() {
    modalCurrentDate = _selectedDate;
  }

  onDaySelected(DateTime day, DateTime focusedDay) {
    modalCurrentDate = day;
    _selectedDate = day;
    notifyListeners();
  }

  int color = 0;

  selectedcolor(int index) {
    color = index;
    notifyListeners();
  }
}
