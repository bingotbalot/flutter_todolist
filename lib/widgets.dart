import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
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
