class User {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  User({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}