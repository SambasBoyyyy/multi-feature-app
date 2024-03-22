// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      readStatus: json['readStatus'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'readStatus': instance.readStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
