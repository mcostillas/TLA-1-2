import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  Task({
    String? id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  }) : id = id ?? const Uuid().v4();

  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
