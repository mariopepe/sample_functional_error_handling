import 'package:meetup_app/domain/home/todo.dart';
import 'package:dartz/dartz.dart';
import 'package:meetup_app/domain/home/todo_failure.dart';

abstract class ITodoRepo {
  Future<Either<TodoFailure, List<Todo>>> fetchTodos();
}
