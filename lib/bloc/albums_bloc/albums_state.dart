part of 'albums_bloc.dart';

@immutable
abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}
class LoadingAlbumsState extends AlbumsState {}

class LoadedAlbumsState extends AlbumsState {
 
  LoadedAlbumsState({required this.albumsList
   });
  final  List? albumsList;

}
class ErrorLoadAlbumsState extends AlbumsState {}

