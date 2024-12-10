import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/add_task_page.dart';
import 'package:to_do_app/tasks/models/save_task.dart';
import 'package:to_do_app/tasks/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskPage()));},child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Consumer<SaveTask>(builder: (context,task,child){
        return ListView.builder(
          itemCount: task.tasks.length,
          itemBuilder: (BuildContext context,index){
            return ListTile(
              
            title: Text(task.tasks[index].taskname,style: TextStyle(decoration: task.tasks[index].checked ? TextDecoration.lineThrough : TextDecoration.none),),
            trailing: Wrap(
              children: [
                Checkbox(value: task.tasks[index].checked, onChanged: (_){
                  context.read<SaveTask>().checkedTask(index);
                }),
                IconButton(onPressed: (){
                  context.read<SaveTask>().deleteTask(task.tasks[index]);
                }, icon: Icon(Icons.delete))
              ],
            ),
            );
          },
        );
      }),
    );
  }
}