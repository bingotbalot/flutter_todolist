import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertodolist/controllers/task_controller.dart';
import 'package:fluttertodolist/theme.dart';
import 'package:fluttertodolist/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:fluttertodolist/models/task.dart';
import 'package:get/get.dart';

class TodoListViewModel extends BaseViewModel {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  final taskController = Get.put(TaskController());

  set date(DateTime date) {}
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  DateTime _selectedhomeDate = DateTime.now();
  DateTime modalCurrentHomeDate = DateTime.now();
  modalHomeDate() {
    modalCurrentHomeDate = _selectedhomeDate;
    notifyListeners();
  }

  showTasks() {
    return Expanded(child: Obx(
      () {
        return ListView.builder(
            itemCount: taskController.taskList.length,
            itemBuilder: (_, index) {
              Task task = taskController.taskList[index];
              print(task.toJson());
              // if (task.date == DateFormat.yMd().format(modalCurrentHomeDate)) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.bottomSheet(Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 150,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      taskController.delete(
                                          taskController.taskList[index]);
                                      taskController.getTasks();
                                      Get.back();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      height: 55,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Delete Note",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: TaskTile(taskController.taskList[index]))
                    ],
                  ))));
              // } else {
              //   return Container();
              // }
            });
      },
    ));
  }

  final TextEditingController textEditingControllertitle =
      TextEditingController();

  final TextEditingController textEditingControllernote =
      TextEditingController();

  final TextEditingController setschedule = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  DateTime modalCurrentDate = DateTime.now();
  modalDate() {
    modalCurrentDate = _selectedDate;
  }

  int color = 0;

  selectedcolor(int index) {
    color = index;
    notifyListeners();
  }

  validate() {
    if (textEditingControllertitle.text.isNotEmpty &&
        textEditingControllernote.text.isNotEmpty) {
      addTasktoDB();
      Get.back();
    } else if (textEditingControllertitle.text.isEmpty ||
        textEditingControllernote.text.isEmpty) {
      Get.snackbar("Required", "All fields should have an entry",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.amber,
            size: 30,
          ),
          colorText: Colors.white,
          padding: const EdgeInsets.all(10));
    }
  }

  addTasktoDB() async {
    int value = await taskController.addTask(
        task: Task(
      title: textEditingControllertitle.text,
      note: textEditingControllernote.text,
      date: setschedule.text,
      color: color,
    ));
    print("My id is " "$value");
  }

  // _showBottomSheet() {
  //   Get.bottomSheet(Container(
  //     padding: EdgeInsets.only(top: 5),
  //     height: 400,
  //     color: Get.isDarkMode ? Colors.black87 : Colors.white,
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 10,
  //           width: 120,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Get.isDarkMode ? Colors.black87 : Colors.black54,
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () {},
  //           child: Container(
  //             margin: EdgeInsets.symmetric(vertical: 5),
  //             height: 55,
  //             width: 200,
  //             color: Colors.red,
  //             decoration: BoxDecoration(
  //                 border: Border.all(
  //               width: 2,
  //               color: Colors.red,
  //             )),
  //           ),
  //         )
  //       ],
  //     ),
  //   ));
  // }
}
