import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/comment.dart';

class CommentsProvider {
  //late Box box1;

  Future fetchComments({required int postId}) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      
      List i = [];
      i = parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
     
      return i;
    } else {
      throw Exception('Failed to load comments');
    }
  }

}