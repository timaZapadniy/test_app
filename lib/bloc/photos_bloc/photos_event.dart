part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}
class GetPhotosEvent extends PhotosEvent { 
   GetPhotosEvent(
      {
      required this.albumId});
  
  final int albumId;
  
}