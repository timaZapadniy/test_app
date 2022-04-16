import 'package:test_app/services/album_services/album_api_provider.dart';

class AlbumRepository {

    final AlbumProvider _postProvider = AlbumProvider();
  Future fetchAlbums({required int userId}) => _postProvider.fetchAlbums(userId: userId);
  
}