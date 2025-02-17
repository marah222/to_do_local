/*
Converts todo_ model into isar todo_ model that we can store in our isar db.
 */
import 'package:isar/isar.dart';
import 'package:to_do_local/domain/model/todo.dart';

part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

// convert isar object --> pure todo_ object
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

// convert todo_ object --> pure isar object
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
