import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/domain/core/failures.dart';
import 'package:todo_app/domain/core/value_objects.dart';
import 'package:todo_app/domain/notes/value_objects.dart';


part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
   const TodoItem._();

  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  dynamic get failureOption {
    return name.value.fold((f) => some(f), (_) => none());
  }
}