
import 'package:to_do_local/domain/model/todo.dart';

abstract class TodoRepo{
  //  get list of todos
  Future<List<Todo>> getTodos();
  // add a new todo
  Future<void> addTodo(Todo newTodo);
  // update an existing one
  Future<void> updateTodo(Todo newTodo);
  // delete a to do
  Future<void> deleteTodo(Todo newTodo);

}