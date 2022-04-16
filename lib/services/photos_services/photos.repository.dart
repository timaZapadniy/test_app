import 'package:test_app/services/photos_services/photos_api_provider.dart';

class PhotosRepository {

    final PhotosProvider _photosProvider = PhotosProvider();
  Future fetchPhotos({required int albumId}) => _photosProvider.fetchPhotos(albumId: albumId);
  
}