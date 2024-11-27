import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';

class TaskNotifier extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get completedTasks => _tasks.where((task) => task.isCompleted).toList();
  List<Task> get pendingTasks => _tasks.where((task) => !task.isCompleted).toList();

  void addTask(String title, String description) {
    _tasks = [..._tasks, Task(title: title, description: description)];
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    _tasks = _tasks.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks = _tasks.where((task) => task.id != id).toList();
    notifyListeners();
  }

  void updateTask(String id, {String? title, String? description}) {
    _tasks = _tasks.map((task) {
      if (task.id == id) {
        return task.copyWith(
          title: title,
          description: description,
        );
      }
      return task;
    }).toList();
    notifyListeners();
  }
}

final taskProvider = ChangeNotifierProvider<TaskNotifier>((ref) {
  return TaskNotifier();
});
