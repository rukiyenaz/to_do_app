import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/tasks/models/save_task.dart';
import 'package:to_do_app/tasks/models/task_model.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController tasknameController=TextEditingController();
  TextEditingController datetimeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add task"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: tasknameController,
              autofocus: true,
              decoration: InputDecoration(
                hintText:"task name"
              ),
            ),
            TextField(
              controller: datetimeController,
              autofocus: true,
              decoration: InputDecoration(
                hintText:"date time"
              ),
            ),
            ElevatedButton(onPressed: (){
              context.read<SaveTask>().addtask(TaskModel(id: null, taskname: tasknameController.text, datetime: datetimeController.text, checked: false));
              
              Navigator.of(context).pop();
            }, child: Text("add"))
          ],
        ),),
    );
  }
}