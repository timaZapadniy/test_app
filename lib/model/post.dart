class Post {
  final int id, userId;
  final String? title, body;

  Post({required this.id, required this.userId, this.title, this.body});
}

// ignore: non_constant_identifier_names
List<Post> demo_posts = [
  Post(
      id: 1,
      userId: 1,
      title: 'ea molestias quasi exercitationem repellat qui ipsa sit aut',
      body:
          'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut'),
Post(
      id: 2,
      userId: 1,
      title: 'ea molestias quasi exercitationem repellat qui ipsa sit aut',
      body:
          'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut')


];
