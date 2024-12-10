import 'package:flutter/material.dart';
import 'package:to_do_app/tasks/models/task_model.dart';

class SaveTask extends ChangeNotifier{
  List<TaskModel> _tasks=[
    TaskModel(
      id: 1, 
      taskname: "test", 
      datetime: "2024-12-07", 
      checked: false),
      TaskModel(
      id: 2, 
      taskname: "test2", 
      datetime: "2024-12-07", 
      checked: false)
  ];

  List<TaskModel> get tasks=> _tasks;

  void addtask(task){
    tasks.add(task);
    notifyListeners();
  }

  void checkedTask(int index){
    tasks[index].isChecked();
    notifyListeners();
  }

  void deleteTask(task){
    tasks.remove(task);
    notifyListeners();
  }

}