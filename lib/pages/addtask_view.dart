import 'package:flutter/material.dart';
import 'package:fluttertodolist/pages/Todolist_viewmodel.dart';
import 'package:fluttertodolist/theme.dart';
import 'package:fluttertodolist/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoListViewModel>.reactive(
        viewModelBuilder: () => TodoListViewModel(),
        builder: ((context, viewModel, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Task",
                        style: heading,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      textfield(
                        title: 'Title',
                        hinttext: 'Enter Title here',
                        controller: viewModel.textEditingControllertitle,
                      ),
                      textfield(
                        title: 'Note',
                        hinttext: 'Enter Note here',
                        controller: viewModel.textEditingControllernote,
                      ),
                      Text(
                        "Date",
                        style: titletask,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: viewModel.setschedule,
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: InputBorder.none,
                            hintText: DateFormat.yMd().format(DateTime.now()),
                            hintStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.purple,
                              ),
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2050),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: Colors.purple,
                                            onPrimary: Colors.white,
                                            onSurface: Colors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: Colors.purple,
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    });

                                if (pickedDate != null) {
                                  viewModel.setschedule.text =
                                      DateFormat.yMd().format(pickedDate);
                                }
                              },
                            ),
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Color",
                                style: titletask,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Wrap(
                                children: List<Widget>.generate(5, (int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      viewModel.selectedcolor(index);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: index == 0
                                              ? Colors.amber
                                              : index == 1
                                                  ? Colors.pink
                                                  : index == 2
                                                      ? Colors.blue
                                                      : index == 3
                                                          ? Colors.red
                                                          : Colors.orange,
                                          child: viewModel.color == index
                                              ? const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                  size: 16,
                                                )
                                              : Container()),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.validate();
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.purple),
                                child: const Text("Create Task",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
