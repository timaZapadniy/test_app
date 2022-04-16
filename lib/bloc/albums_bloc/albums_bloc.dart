import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/album_services/album_repository.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc({required this.albumRepository}) : super(AlbumsInitial());
  final AlbumRepository albumRepository;
  @override
  Stream<AlbumsState> mapEventToState(AlbumsEvent event) async* {
    if (event is GetAlbumsEvent) {
      yield LoadingAlbumsState();
      try {
        final List _loadedAlbums = await albumRepository.fetchAlbums(userId: event.userId);
        yield LoadedAlbumsState(albumsList: [..._loadedAlbums]);
      } catch (_) {
        yield ErrorLoadAlbumsState();
      }
    } 
  }
}
