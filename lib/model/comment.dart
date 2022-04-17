
class Comment {
  final int id, postId;
  final String? name, email, body;

  Comment({required this.id, required this.postId, this.name, this.email, this.body});
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }
}