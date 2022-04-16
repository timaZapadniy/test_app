part of 'photos_bloc.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}
class LoadingPhotosState extends PhotosState {}

class LoadedPhotosState extends PhotosState {
 
  LoadedPhotosState({required this.photosList
   });
  final  List? photosList;

}
class ErrorLoadPhotosState extends PhotosState {}


