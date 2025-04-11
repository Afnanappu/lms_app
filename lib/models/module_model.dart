// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModuleModel {
  final String id;
  final String title;
  final String description;
  ModuleModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory ModuleModel.fromMap(Map<String, dynamic> map) {
    return ModuleModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  factory ModuleModel.fromJson(String source) =>
      ModuleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ModuleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'ModuleModel(id: $id, title: $title, description: $description)';
}
