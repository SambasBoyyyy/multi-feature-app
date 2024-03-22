// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) => ListModel(
      status: json['status'] as String,
      message: json['message'] as String,
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error.toJson(),
      'data': instance.data.toJson(),
    };
