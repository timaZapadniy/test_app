part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
 
  LoadedPostsState({required this.postsList
   });
  final  List? postsList;

}
class ErrorLoadPostsState extends PostsState {}

