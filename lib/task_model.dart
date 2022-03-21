class TaskModel {
   bool isChecked;
  final String text;

  TaskModel({this.isChecked=false, required this.text});

   void TaskCompleted()
   {
     isChecked = !isChecked;
   }
}
