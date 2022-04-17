import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/comments_services/comments_repository.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.commentsRepository}) : super(CommentsInitial());
    final CommentsRepository commentsRepository;
    @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is GetCommentsEvent) {
      yield LoadingCommentsState();
      try {
        final List _loadedComments = await commentsRepository.fetchComments(postId: event.postId);
        yield LoadedCommentsState(commentsList: [..._loadedComments]);
      } catch (_) {
        yield ErrorLoadCommentsState();
      }
    } 
  }
}
