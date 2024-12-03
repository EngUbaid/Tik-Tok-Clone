class Video {
  final String id;
  final String description;
  final String user;
  final String videoUrl;

  Video({
    required this.id,
    required this.description,
    required this.user,
    required this.videoUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      description: json['description'] ?? '',
      user: json['user'] ?? '',
      videoUrl: json['video'],
    );
  }
}
