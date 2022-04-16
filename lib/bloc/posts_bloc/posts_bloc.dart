import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/post_services/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.postsRepository}) : super(PostsInitial());
  final PostRepository postsRepository;
  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is GetPostsEvent) {
      yield LoadingPostsState();
      try {
        final List _loadedPosts = await postsRepository.fetchPosts(userId: event.userId);
        yield LoadedPostsState(postsList: [..._loadedPosts]);
      } catch (_) {
        yield ErrorLoadPostsState();
      }
    } 
  }
}
