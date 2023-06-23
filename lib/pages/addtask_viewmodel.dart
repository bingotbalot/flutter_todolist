// import 'package:flutter/material.dart';
// import 'package:fluttertodolist/controllers/task_controller.dart';
// import 'package:fluttertodolist/models/task.dart';
// import 'package:intl/intl.dart';
// import 'package:stacked/stacked.dart';
// import 'package:get/get.dart';

// class AddTaskViewModel extends BaseViewModel {
//   final TextEditingController textEditingControllertitle =
//       TextEditingController();

//   final TextEditingController textEditingControllernote =
//       TextEditingController();

//   final TextEditingController setschedule = TextEditingController();
//   final TaskController taskController = Get.put(TaskController());

//   DateTime _selectedDate = DateTime.now();

//   DateTime modalCurrentDate = DateTime.now();
//   modalDate() {
//     modalCurrentDate = _selectedDate;
//   }

//   int color = 0;

//   selectedcolor(int index) {
//     color = index;
//     notifyListeners();
//   }

//   validate() {
//     if (textEditingControllertitle.text.isNotEmpty &&
//         textEditingControllernote.text.isNotEmpty) {
//       addTasktoDB();
//       Get.back();
//     } else if (textEditingControllertitle.text.isEmpty ||
//         textEditingControllernote.text.isEmpty) {
//       Get.snackbar("Required", "All fields should have an entry",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.purple,
//           icon: const Icon(
//             Icons.warning_amber_rounded,
//             color: Colors.amber,
//             size: 30,
//           ),
//           colorText: Colors.white,
//           padding: const EdgeInsets.all(10));
//     }
//   }

//   addTasktoDB() async {
//     int value = await taskController.addTask(
//         task: Task(
//       title: textEditingControllertitle.text,
//       note: textEditingControllernote.text,
//       date: setschedule.text,
//       color: color,
//     ));
//     print("My id is " "$value");
//   }
// }
