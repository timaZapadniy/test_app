import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/posts_bloc/posts_bloc.dart';
import 'package:test_app/screens/post_list_screen/post_pre_item.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({ Key? key, required this.userId }) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    final PostsBloc usersBloc = BlocProvider.of<PostsBloc>(context);
    usersBloc.add(GetPostsEvent(userId: userId));
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Posts:', style: TextStyle(fontSize: 20, color: Color(0xFF522e23), fontWeight: FontWeight.bold),),
          ),
          BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
          if (state is PostsInitial) {
          return const SizedBox();
        }

        if (state is LoadingPostsState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedPostsState) {
          return  Column(children: [
            PostPreviewItem(post: state.postsList![0]),
            PostPreviewItem(post: state.postsList![1]),
            PostPreviewItem(post: state.postsList![2]),
          ],);   
        }

        if (state is ErrorLoadPostsState) {
          return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      })
          
        ],
      ),
    );
  }
}