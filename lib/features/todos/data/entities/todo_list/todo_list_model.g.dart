// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoListModelImpl _$$TodoListModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoListModelImpl(
      todos: (json['todos'] as List<dynamic>?)
              ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$TodoListModelImplToJson(_$TodoListModelImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'message': instance.message,
    };

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      todo: json['todo'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedOn: json['deletedOn'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
      'isDeleted': instance.isDeleted,
      'deletedOn': instance.deletedOn,
      'message': instance.message,
    };
