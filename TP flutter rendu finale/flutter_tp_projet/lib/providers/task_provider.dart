import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  String _filterStatus = 'all';
  String _sortBy = 'date';

  List<Task> get tasks {
    List<Task> filteredTasks = List.from(_tasks);

    switch (_filterStatus) {
      case 'active':
        filteredTasks = filteredTasks.where((task) => !task.isCompleted).toList();
        break;
      case 'completed':
        filteredTasks = filteredTasks.where((task) => task.isCompleted).toList();
        break;
      default:
        break;
    }

    switch (_sortBy) {
      case 'priority':
        filteredTasks.sort((a, b) => _priorityValue(b.priority).compareTo(_priorityValue(a.priority)));
        break;
      case 'title':
        filteredTasks.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case 'date':
      default:
        filteredTasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }

    return filteredTasks;
  }

  int _priorityValue(String priority) {
    switch (priority) {
      case 'high':
        return 3;
      case 'medium':
        return 2;
      case 'low':
        return 1;
      default:
        return 0;
    }
  }

  String get filterStatus => _filterStatus;

  String get sortBy => _sortBy;

  int get taskCount => _tasks.length;

  int get completedCount => _tasks.where((task) => task.isCompleted).length;

  int get activeCount => _tasks.where((task) => !task.isCompleted).length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void toggleTaskStatus(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
      notifyListeners();
    }
  }

  void setFilter(String filter) {
    _filterStatus = filter;
    notifyListeners();
  }

  void setSortBy(String sort) {
    _sortBy = sort;
    notifyListeners();
  }

  void clearCompleted() {
    _tasks.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }

  void loadSampleData() {
    final now = DateTime.now();
    _tasks.addAll([
      Task(
        id: '1',
        title: 'Terminer le TP Flutter',
        description: 'Finaliser l\'application et préparer le rendu pour MyGes',
        isCompleted: false,
        createdAt: now,
        priority: 'high',
      ),
      Task(
        id: '2',
        title: 'Réviser les Widgets Flutter',
        description: 'Revoir Column, Row, Padding, Center, etc.',
        isCompleted: true,
        createdAt: now.subtract(const Duration(days: 1)),
        priority: 'medium',
      ),
      Task(
        id: '3',
        title: 'Configurer Waydroid',
        description: 'Installer et tester l\'émulateur Android sur Ubuntu Wayland',
        isCompleted: true,
        createdAt: now.subtract(const Duration(days: 2)),
        priority: 'medium',
      ),
      Task(
        id: '4',
        title: 'Apprendre Provider',
        description: 'Comprendre la gestion d\'état avec Provider et ChangeNotifier',
        isCompleted: false,
        createdAt: now.subtract(const Duration(hours: 3)),
        priority: 'high',
      ),
      Task(
        id: '5',
        title: 'Faire les courses',
        description: 'Acheter du pain, du lait et des fruits',
        isCompleted: false,
        createdAt: now.subtract(const Duration(hours: 5)),
        priority: 'low',
      ),
    ]);
    notifyListeners();
  }
}
