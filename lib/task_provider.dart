import 'package:flutter/cupertino.dart';
import 'package:todo/task_model.dart';

class TaskProvider extends ChangeNotifier
{
  List<TaskModel> taskList = [
  ];
  bool isChecked = false;

  void newTask(TaskModel task)
  {
    taskList.add(task);
    notifyListeners();
  }
  void undoTask(index,TaskModel task)
  {
    taskList.insert(index, task);
    notifyListeners();
  }
  void updateTask(TaskModel task)
  {
    task.TaskCompleted();
    notifyListeners();
  }

  void removeTask(TaskModel task)
  {
    taskList.remove(task);
    notifyListeners();
  }
}