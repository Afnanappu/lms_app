// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum VideoType { youtube, vimeo }

class VideoModel {
  final String id;
  final String title;
  final String description;
  final VideoType videoType;
  final String videoUrl;
  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoType,
    required this.videoUrl,
  });

  VideoModel copyWith({
    String? id,
    String? title,
    String? description,
    VideoType? videoType,
    String? videoUrl,
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      videoType: videoType ?? this.videoType,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      videoType:
          map['video_type'] == 'YouTube' ? VideoType.youtube : VideoType.vimeo,
      videoUrl: map['video_url'] as String,
    );
  }

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideoModel(id: $id, title: $title, description: $description, videoType: $videoType, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(covariant VideoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.videoType == videoType &&
        other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        videoType.hashCode ^
        videoUrl.hashCode;
  }
}
