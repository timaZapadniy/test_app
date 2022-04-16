class Photo {
  final int id, albumId;
  final String? title, url, thumbnailUrl;

  Photo({required this.id, required this.albumId, this.title, this.thumbnailUrl, this.url});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      url: json['url'],
    );
  }
}
