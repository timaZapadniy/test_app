part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent { 
   GetCommentsEvent(
      {
      required this.postId});
  
  final int postId;
  
}