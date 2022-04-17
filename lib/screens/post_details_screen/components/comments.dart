import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/comments_bloc/comments_bloc.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/screens/post_details_screen/components/comment_item.dart';

class Comments extends StatelessWidget {
  const Comments({ Key? key, required this.post }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
        final CommentsBloc usersBloc = BlocProvider.of<CommentsBloc>(context);
    usersBloc.add(GetCommentsEvent(postId: post.id));
    return BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
        if (state is CommentsInitial) {
        return const SizedBox();
      }

      if (state is LoadingCommentsState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoadedCommentsState) {
        List _items = [];
        state.commentsList!.forEach((element){
          _items.add(CommentItem(comment: element));
        });
        return Column(children: [..._items],);
      }

      if (state is CommentsAddedState) {
         List _items = [];
        state.commentsList!.forEach((element){
          _items.add(CommentItem(comment: element));
        });
        return Column(children: [..._items],);
      }

      if (state is ErrorLoadCommentsState) {
        return const Center(child: Center(child: Text('')));
      }
      return const SizedBox();
    });
  }
}