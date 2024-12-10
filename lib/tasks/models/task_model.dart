import 'package:flutter/material.dart';

class TaskModel {
  final String taskname;
  final int? id;
  final String datetime;
  bool checked;

  TaskModel({required this.id,required this.taskname,required this.datetime,required this.checked});

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "taskname":taskname,
      "datetime":datetime,
      "checked":checked,
    };

  }

  factory TaskModel.fromJson(Map<String,dynamic> json){
    return TaskModel(
      id:json['id'],
      taskname: json['taskname'], 
      datetime: json['datetime'],
      checked: json['checked']);
  }

  void isChecked(){
    checked=!checked;
  }
}