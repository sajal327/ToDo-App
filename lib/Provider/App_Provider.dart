import 'package:flutter/foundation.dart';
import '../Models/models.dart';


class todoProvider with ChangeNotifier{

  final List<TaskObject> _Task = [];


  get Task => _Task;


  void setDoOrNotAtTheIndex(int index,bool value){
    _Task[index].doneOrNot = value!;
    notifyListeners();
  }


  void setANewTask(String value){
    _Task.add(TaskObject(title: value , doneOrNot: false),);
    notifyListeners();
  }

}