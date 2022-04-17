part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent { 
   GetCommentsEvent(
      {
      required this.postId});
  final int postId;
}

class AddCommentEvent extends CommentsEvent { 
   AddCommentEvent({required this.name, required this.email, required this.comment, required this. postId});
  
  final String name;
  final String email;
  final String comment;
  final int postId;
}