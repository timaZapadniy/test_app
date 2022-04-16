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
    return Column(
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
        return        
        ListView.builder(
          shrinkWrap: true,
            itemCount: state.postsList!.length>=3? 3 : state.postsList!.length,
            itemBuilder: (context, index){
              return PostPreviewItem(post: state.postsList![index],);
            });
      }

      if (state is ErrorLoadPostsState) {
        return const Center(child: Center(child: Text('')));
      }
      return const SizedBox();
    })
        
      ],
    );
  }
}