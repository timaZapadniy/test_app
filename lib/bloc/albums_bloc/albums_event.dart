part of 'albums_bloc.dart';

@immutable
abstract class AlbumsEvent {}
class GetAlbumsEvent extends AlbumsEvent { 
   GetAlbumsEvent(
      {
      required this.userId});
  
  final int userId;
  
}
