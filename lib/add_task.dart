import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_model.dart';
import 'package:todo/task_provider.dart';
import 'package:todo/tasks_screen.dart';

class AddTask extends StatelessWidget {
  TextEditingController taskText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('f9fafe'),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          const BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: IconButton(
                          onPressed: () {
                            taskText.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextFormField(
                  controller: taskText,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Add a new Task',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(left: 20),
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.cake_rounded),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Today',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: const Icon(
                      Icons.stop_circle_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_download_outlined,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  Icon(
                    Icons.flag_outlined,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 150,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextButton(
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .newTask(TaskModel(text: taskText.text));
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TasksScreen()),
                  (route) => false);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'New Task',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 6,
                ),
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
