import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'dart:convert';

import 'package:meetup_app/domain/home/i_todo_repo.dart';
import 'package:meetup_app/domain/home/todo.dart';
import 'package:meetup_app/infrastructure/home/todo_dto.dart';

import '../../domain/home/todo_failure.dart';

@LazySingleton(as: ITodoRepo)
class TodoRepo implements ITodoRepo {
  @override
  Future<Either<TodoFailure, List<Todo>>> fetchTodos() async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/todos';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> todos = json.decode(response.body);
        final parsedTodos = todos
            .map((e) => TodoDto.fromJson(e as Map<String, dynamic>).toDomain())
            .toList(growable: false);

        return right(parsedTodos);
      } else {
        return left(const TodoFailure.serverError());
      }
    } on SocketException {
      return left(const TodoFailure.noInternetConnection());
    } catch (e) {
      return left(const TodoFailure.unexpected());
    }
  }
}
