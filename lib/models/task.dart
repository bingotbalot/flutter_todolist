import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Task {
  int? id;
  String? title;
  String? note;
  String? date;
  int? color;

  Task({
    this.color,
    this.date,
    this.note,
    this.title,
    this.id,
  });

  Task.fromJson(Map<String, dynamic> json) {
    //key:value
    id = json['id'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['date'] = this.date;
    data['color'] = this.color;

    return data;
  }
}
