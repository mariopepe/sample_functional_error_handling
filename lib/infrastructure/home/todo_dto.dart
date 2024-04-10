import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetup_app/domain/home/todo.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
class TodoDto with _$TodoDto {
  factory TodoDto({
    required int id,
    required int userId,
    required String title,
    required bool completed,
  }) = _TodoDto;

  TodoDto._();

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Todo toDomain() => Todo(
        id: id,
        userId: userId,
        title: title,
        completed: completed,
      );
}
