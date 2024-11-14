// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) {
  return _TodoListModel.fromJson(json);
}

/// @nodoc
mixin _$TodoListModel {
  List<TodoModel> get todos => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this TodoListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoListModelCopyWith<TodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListModelCopyWith<$Res> {
  factory $TodoListModelCopyWith(
          TodoListModel value, $Res Function(TodoListModel) then) =
      _$TodoListModelCopyWithImpl<$Res, TodoListModel>;
  @useResult
  $Res call(
      {List<TodoModel> todos, int total, int skip, int limit, String message});
}

/// @nodoc
class _$TodoListModelCopyWithImpl<$Res, $Val extends TodoListModel>
    implements $TodoListModelCopyWith<$Res> {
  _$TodoListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoListModelImplCopyWith<$Res>
    implements $TodoListModelCopyWith<$Res> {
  factory _$$TodoListModelImplCopyWith(
          _$TodoListModelImpl value, $Res Function(_$TodoListModelImpl) then) =
      __$$TodoListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TodoModel> todos, int total, int skip, int limit, String message});
}

/// @nodoc
class __$$TodoListModelImplCopyWithImpl<$Res>
    extends _$TodoListModelCopyWithImpl<$Res, _$TodoListModelImpl>
    implements _$$TodoListModelImplCopyWith<$Res> {
  __$$TodoListModelImplCopyWithImpl(
      _$TodoListModelImpl _value, $Res Function(_$TodoListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
    Object? message = null,
  }) {
    return _then(_$TodoListModelImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoListModelImpl implements _TodoListModel {
  const _$TodoListModelImpl(
      {final List<TodoModel> todos = const [],
      this.total = 0,
      this.skip = 0,
      this.limit = 0,
      this.message = ''})
      : _todos = todos;

  factory _$TodoListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoListModelImplFromJson(json);

  final List<TodoModel> _todos;
  @override
  @JsonKey()
  List<TodoModel> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int skip;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'TodoListModel(todos: $todos, total: $total, skip: $skip, limit: $limit, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoListModelImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), total, skip, limit, message);

  /// Create a copy of TodoListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoListModelImplCopyWith<_$TodoListModelImpl> get copyWith =>
      __$$TodoListModelImplCopyWithImpl<_$TodoListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoListModelImplToJson(
      this,
    );
  }
}

abstract class _TodoListModel implements TodoListModel {
  const factory _TodoListModel(
      {final List<TodoModel> todos,
      final int total,
      final int skip,
      final int limit,
      final String message}) = _$TodoListModelImpl;

  factory _TodoListModel.fromJson(Map<String, dynamic> json) =
      _$TodoListModelImpl.fromJson;

  @override
  List<TodoModel> get todos;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;
  @override
  String get message;

  /// Create a copy of TodoListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoListModelImplCopyWith<_$TodoListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  int get id => throw _privateConstructorUsedError;
  String get todo => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get deletedOn => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call(
      {int id,
      String todo,
      bool completed,
      int userId,
      bool isDeleted,
      String deletedOn,
      String message});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todo = null,
    Object? completed = null,
    Object? userId = null,
    Object? isDeleted = null,
    Object? deletedOn = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedOn: null == deletedOn
          ? _value.deletedOn
          : deletedOn // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoModelImplCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$$TodoModelImplCopyWith(
          _$TodoModelImpl value, $Res Function(_$TodoModelImpl) then) =
      __$$TodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String todo,
      bool completed,
      int userId,
      bool isDeleted,
      String deletedOn,
      String message});
}

/// @nodoc
class __$$TodoModelImplCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$TodoModelImpl>
    implements _$$TodoModelImplCopyWith<$Res> {
  __$$TodoModelImplCopyWithImpl(
      _$TodoModelImpl _value, $Res Function(_$TodoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todo = null,
    Object? completed = null,
    Object? userId = null,
    Object? isDeleted = null,
    Object? deletedOn = null,
    Object? message = null,
  }) {
    return _then(_$TodoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedOn: null == deletedOn
          ? _value.deletedOn
          : deletedOn // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoModelImpl implements _TodoModel {
  const _$TodoModelImpl(
      {this.id = 0,
      this.todo = '',
      this.completed = false,
      this.userId = 0,
      this.isDeleted = false,
      this.deletedOn = '',
      this.message = ''});

  factory _$TodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String todo;
  @override
  @JsonKey()
  final bool completed;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final String deletedOn;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'TodoModel(id: $id, todo: $todo, completed: $completed, userId: $userId, isDeleted: $isDeleted, deletedOn: $deletedOn, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.deletedOn, deletedOn) ||
                other.deletedOn == deletedOn) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, todo, completed, userId, isDeleted, deletedOn, message);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      __$$TodoModelImplCopyWithImpl<_$TodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelImplToJson(
      this,
    );
  }
}

abstract class _TodoModel implements TodoModel {
  const factory _TodoModel(
      {final int id,
      final String todo,
      final bool completed,
      final int userId,
      final bool isDeleted,
      final String deletedOn,
      final String message}) = _$TodoModelImpl;

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$TodoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get todo;
  @override
  bool get completed;
  @override
  int get userId;
  @override
  bool get isDeleted;
  @override
  String get deletedOn;
  @override
  String get message;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
