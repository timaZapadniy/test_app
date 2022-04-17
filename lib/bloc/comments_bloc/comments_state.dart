part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}
class LoadingCommentsState extends CommentsState {}

class LoadedCommentsState extends CommentsState {
 
  LoadedCommentsState({required this.commentsList
   });
  final  List? commentsList;

}
class ErrorLoadCommentsState extends CommentsState {}
