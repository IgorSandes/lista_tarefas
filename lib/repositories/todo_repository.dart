import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

const todoListKey = 'Todo_list';

class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonstring = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonstring) as List;
    return jsonDecoded.map((e) => Todo.fronJson(e)).toList();
  }

  void saveTodoList(List<Todo>todos) {
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }

}