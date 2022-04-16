import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/photos_services/photos.repository.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc({required this.photosRepository}) : super(PhotosInitial());
final PhotosRepository photosRepository;
@override
  Stream<PhotosState> mapEventToState(PhotosEvent event) async* {
    if (event is GetPhotosEvent) {
      yield LoadingPhotosState();
      try {
        final List _loadedPhotos = await photosRepository.fetchPhotos(albumId: event.albumId);
        yield LoadedPhotosState(photosList: [..._loadedPhotos]);
      } catch (_) {
        yield ErrorLoadPhotosState();
      }
    } 
  }
}
