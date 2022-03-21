import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_model.dart';
import 'package:todo/task_provider.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> taskList = Provider.of<TaskProvider>(context).taskList;

    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                alignment: Alignment.centerLeft,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    taskList[index].text,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              child: Consumer<TaskProvider>(
                builder: (context, myProvider, child) => Container(
                  alignment: Alignment.centerLeft,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.red),
                        child: Transform.scale(
                          scale: 1.4,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Checkbox(
                                tristate: false,
                                value: myProvider.taskList[index].isChecked,
                                shape: const CircleBorder(),
                                onChanged: (value)
                                {
                                  myProvider.updateTask(taskList[index]);
                                  if (myProvider.taskList[index].isChecked) {
                                    myProvider.removeTask(taskList[index]);
                                  }
                                }),
                          ),
                        ),
                      ),
                      Text(
                        '${myProvider.taskList[index].text}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              onDismissed: (DismissDirection dir)
              {
                TaskModel deletedTask = new TaskModel(text: taskList[index].text);
                Provider.of<TaskProvider>(context, listen: false)
                    .removeTask(taskList[index]);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text("Task Deleted"),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          Provider.of<TaskProvider>(context, listen: false)
                              .undoTask(index, deletedTask);
                        },
                      )),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount: taskList.length),
    );
  }
}
