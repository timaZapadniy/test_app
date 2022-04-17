import 'package:test_app/services/comments_services/comments_api_provider.dart';

class CommentsRepository {
  final CommentsProvider _postProvider = CommentsProvider();
  Future fetchComments({required int postId}) =>
      _postProvider.fetchComments(postId: postId);
  Future addComment(
          {required String name,
          required String email,
          required String comment,
          required int postId}) =>
      _postProvider.addComment(comment: comment, email: email, name: name, postId: postId);
}
