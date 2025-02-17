import 'package:isar/isar.dart';
import 'package:to_do_local/data/models/isar_todo.dart';
import 'package:to_do_local/domain/model/todo.dart';
import 'package:to_do_local/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    final todoIsar = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
  @override
  Future<void> updateTodo(Todo newTodo) async{
    final todoIsar = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
  @override
  Future<void> deleteTodo(Todo newTodo) async{
    await db.writeTxn(() => db.todoIsars.delete(newTodo.id));
  }
}
