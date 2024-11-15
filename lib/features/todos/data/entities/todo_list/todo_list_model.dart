

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_model.freezed.dart';
part 'todo_list_model.g.dart';

// JSON serialization for this model is generated using [Freezed], which includes the toJson and fromJson 
// functions. Default values are provided for each field to ensure that the model can be instantiated 
// even when certain values are not included in the JSON data.
@freezed
class TodoListModel with _$TodoListModel {
    const factory TodoListModel({
        @Default([]) List<TodoModel> todos,
        @Default(0) int total,
        @Default(0) int skip,
        @Default(0) int limit,
        @Default('') String message,
    }) = _TodoListModel;

    factory TodoListModel.fromJson(Map<String, dynamic> json) => _$TodoListModelFromJson(json);
}

@Freezed(copyWith: true)
class TodoModel with _$TodoModel {
    const factory TodoModel({
        @Default(0) int id,
        @Default('') String todo,
        @Default(false) bool completed,
        @Default(0) int userId,
        @Default(false) bool isDeleted,
        @Default('') String deletedOn,
        @Default('') String message,
    }) = _TodoModel;

    factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
