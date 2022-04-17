import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/posts_bloc/posts_bloc.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/screens/post_list_screen/post_pre_item.dart';
import 'package:test_app/screens/post_list_screen/posts_screen.dart';
import 'package:test_app/screens/user_details_screen/components/header_btn.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({ Key? key, required this.user }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    final PostsBloc usersBloc = BlocProvider.of<PostsBloc>(context);
    usersBloc.add(GetPostsEvent(userId: user.id));
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
      if (state is PostsInitial) {
      return const SizedBox();
        }

        if (state is LoadingPostsState) {
      return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedPostsState) {
      return  Column(children: [
        Padding(
        padding: const EdgeInsets.all(4.0),
        child:  Row(
          children: [
             const Text('Posts:', style: TextStyle(fontSize: 20, color: Color(0xFF522e23), fontWeight: FontWeight.bold),),
             const Spacer(),
             HeaderButton(
               onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context) => PostsScreen(user: user,)));
             } ,text: 'View all...',)
          ],
        ),
      ),
        PostPreviewItem(post: state.postsList![0], user: user,),
        PostPreviewItem(post: state.postsList![1], user: user,),
        PostPreviewItem(post: state.postsList![2], user: user,),
      ],);   
        }

        if (state is ErrorLoadPostsState) {
      return const Center(child: Center(child: Text('')));
        }
        return const SizedBox();
      }),
    );
  }
}