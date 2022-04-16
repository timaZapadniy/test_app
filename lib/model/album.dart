import 'package:test_app/model/photo.dart';

class Album {
  final int id, userId;
  final String? title, thumbnailUrl;
  final List<Photo>? photos;

  Album({required this.id, required this.userId, this.title, this.thumbnailUrl, this.photos});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}
