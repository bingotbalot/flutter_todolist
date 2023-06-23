import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodolist/controllers/task_controller.dart';
import 'package:fluttertodolist/notify.dart';
import 'package:fluttertodolist/pages/Todolist_viewmodel.dart';
import 'package:fluttertodolist/pages/addtask_view.dart';
import 'package:fluttertodolist/theme.dart';
import 'package:fluttertodolist/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:get/get.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoListViewModel>.reactive(
        viewModelBuilder: () => TodoListViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                leading: GestureDetector(
                  onTap: () {
                    TodoListViewModel().switchTheme();
                    NotifyHelper().showLocalNotification(
                      'Flutter Notification',
                      'Congrats on your first local notification',
                    );
                  },
                  child: const Icon(
                    Icons.nightlight_round,
                    size: 20,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  DateFormat.yMMMMd().format(DateTime.now()),
                                  style: heading,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Today",
                                  style: subHeading,
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            button(
                                label: "+ Add Task",
                                onTap: () async {
                                  await Get.to(() => AddTask());
                                  viewModel.taskController.getTasks();
                                }),
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: DatePicker(
                        DateTime.now(),
                        height: 100,
                        width: 80,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Colors.purple,
                        selectedTextColor: Colors.white,
                        dateTextStyle: calendar,
                        dayTextStyle: calendar,
                        monthTextStyle: calendar,
                        onDateChange: (date) {
                          viewModel.modalCurrentHomeDate = date;
                        },
                      ),
                    ),
                    TodoListViewModel().showTasks()
                  ],
                ),
              ),
            )));
  }
}
