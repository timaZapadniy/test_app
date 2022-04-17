import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/model/user.dart';

class UserProvider {
  Future fetchUsers() async {
    var usersBox = await Hive.openBox<String>('users');

    if (usersBox.get('users') == null) {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        usersBox.clear();//for update
        usersBox.put('users', response.body);
        
        final parsed = jsonDecode(response.body);
        List<User> i = [];
        i = parsed.map<User>((json) => User.fromJson(json)).toList();

        return i;
      } else {
        throw Exception('Failed to load users');
      }
    }else{
      final parsed = jsonDecode(usersBox.get('users')!);
        List<User> i = [];
        i = parsed.map<User>((json) => User.fromJson(json)).toList();

        return i;
    }
  }
}
