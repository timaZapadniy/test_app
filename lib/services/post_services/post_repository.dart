import 'package:test_app/services/post_services/post_api_provider.dart';

class PostRepository {

    final PostProvider _postProvider = PostProvider();
  Future fetchPosts({required int userId}) => _postProvider.fetchPosts(userId: userId);
  
}