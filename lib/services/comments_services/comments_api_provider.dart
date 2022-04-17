import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/comment.dart';

class CommentsProvider {
  //late Box box1;

  Future fetchComments({required int postId}) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);

      List i = [];
      i = parsed.map<Comment>((json) => Comment.fromJson(json)).toList();

      return i;
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future addComment({
    required String name,
    required String email,
    required String comment,
    required int postId,
  }) async {
    final addCommentResponse = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'body': comment,
        'postId': '$postId',
      }),
    );
    final newComment = jsonDecode(addCommentResponse.body);
    final Comment _newCommentObj =
        Comment(
          id: newComment['id'], 
          postId: int.parse(newComment['postId']),
          name: newComment['name'],
          email: newComment['email'],
          body: newComment['postId'],
          );

    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);

      List i = [];
      i = parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
      i.add(_newCommentObj);
      return i;
    } else {
      throw Exception('Failed to send comment');
    }
  }
}
