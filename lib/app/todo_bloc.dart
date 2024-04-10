// ignore_for_file: sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meetup_app/domain/home/i_todo_repo.dart';
import 'package:meetup_app/domain/home/todo.dart';
import 'package:meetup_app/domain/home/todo_failure.dart';

part 'todo_bloc.freezed.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ITodoRepo todoRepo;

  TodoBloc(this.todoRepo) : super(const TodoState.initial()) {
    on<RefreshTodos>((event, emit) async {
      emit(const TodoState.loading());

      await Future.delayed(Duration(seconds: 2));

      final todos = await todoRepo.fetchTodos();

      todos.fold(
        (l) => emit(TodoState.error(l)),
        (r) => emit(TodoState.success(r)),
      );
    });
  }
}

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.refreshTodos() = RefreshTodos;
}

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = Initial;
  const factory TodoState.loading() = Loading;
  const factory TodoState.error(TodoFailure failure) = Error;
  const factory TodoState.success(List<Todo> todos) = Success;
}
