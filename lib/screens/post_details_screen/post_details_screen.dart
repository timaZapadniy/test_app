import 'package:flutter/material.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/model/user.dart';

import 'components/post_widget.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({ Key? key, required this.post, required this.user}) : super(key: key);
  final Post post;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments'),),
      body: PostWidget(post: post, user: user,),
    );
  }
}