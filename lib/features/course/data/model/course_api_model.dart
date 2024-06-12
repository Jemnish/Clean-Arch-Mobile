import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

final courseApiModelProvider = Provider<CourseApiModel>(
  (ref) => const CourseApiModel.empty(),
);

@JsonSerializable()
class CourseApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  const CourseApiModel({
    required this.courseId,
    required this.courseName,
  });
  const CourseApiModel.empty()
      : courseId = '',
        courseName = '';

  // From Json , write full code without generator
  factory CourseApiModel.fromJson(Map<String, dynamic> json) {
    return CourseApiModel(
      courseId: json['_id'],
      courseName: json['courseName'],
    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
    };
  }

  // Convert API Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to API Object
  CourseApiModel fromEntity(CourseEntity entity) => CourseApiModel(
        courseId: entity.courseId ?? '',
        courseName: entity.courseName,
      );

  // Convert API List to Entity List
  List<CourseEntity> toEntityList(List<CourseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [courseId, courseName];
}
