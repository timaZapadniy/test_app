import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/post.dart';

class PostProvider {
  //late Box box1;

  Future fetchPosts({required int userId}) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$userId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      List i = [];
      i = parsed.map<Post>((json) => Post.fromJson(json)).toList();
     
      return i;
    } else {
      throw Exception('Failed to load users');
    }
  }
}