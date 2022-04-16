import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/user.dart';

class UserProvider {
  //late Box box1;

  Future fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      List i = [];
      i = parsed.map<User>((json) => User.fromJson(json)).toList();
     
      return i;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
