import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodolist/models/task.dart';
import 'package:fluttertodolist/theme.dart';

class button extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const button({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.purple),
        child: Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}

class textfield extends StatelessWidget {
  final String title;
  final String hinttext;
  final TextEditingController? controller;
  final Widget? widget;
  const textfield({
    super.key,
    required this.title,
    required this.hinttext,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titletask,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 52,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: hinttext, border: InputBorder.none),
                      controller: controller,
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        )
                ],
              )),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(15),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getBGClr(task?.color ?? 0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task?.title ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(height: 12),
                Text(
                  task?.note ?? "",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[100],
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10),
          //   height: 60,
          //   width: 0.5,
          //   color: Colors.grey[200]!.withOpacity(0.7),
          // ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Colors.amber;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      case 4:
        return Colors.orange;
      default:
        return Colors.pink;
    }
  }
}
