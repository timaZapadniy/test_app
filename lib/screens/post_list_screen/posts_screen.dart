import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/posts_bloc/posts_bloc.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/screens/post_list_screen/post_pre_item.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({ Key? key, required this.user }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
          if (state is PostsInitial) {
          return const SizedBox();
        }

        if (state is LoadingPostsState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedPostsState) {
          return  ListView.builder(
            itemCount: state.postsList!.length,
            itemBuilder: (context, index){
              return PostPreviewItem(post: state.postsList![index], user: user,);
            });   
        }

        if (state is ErrorLoadPostsState) {
          return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      })
    );
  }
}