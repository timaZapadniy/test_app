
import 'package:test_app/services/comments_services/comments_api_provider.dart';

class CommentsRepository {

    final CommentsProvider _postProvider = CommentsProvider();
  Future fetchComments({required int postId}) => _postProvider.fetchComments(postId: postId);
  
}