import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/domain/core/value_objects.dart';
import 'package:todo_app/domain/notes/todo_item.dart';
import 'package:todo_app/domain/notes/value_objects.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: List3(emptyList()),
      );


 Option<ValueFailure<dynamic>> get failureOption { //fix later!!!
    return body.failureOrUnit
        .andThen(todos.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}