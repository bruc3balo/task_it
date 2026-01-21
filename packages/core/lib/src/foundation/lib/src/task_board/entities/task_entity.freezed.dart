// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskEntity {
  String get id => throw _privateConstructorUsedError;
  TaskTitleValue get title => throw _privateConstructorUsedError;
  TaskDescriptionValue get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get dueAt => throw _privateConstructorUsedError;
  TaskStatusEntity get status => throw _privateConstructorUsedError;
  TaskManagerIdValue get managerId =>
      throw _privateConstructorUsedError; // The Manager
  AssigneeIdValue? get assigneeUserId => throw _privateConstructorUsedError;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
    TaskEntity value,
    $Res Function(TaskEntity) then,
  ) = _$TaskEntityCopyWithImpl<$Res, TaskEntity>;
  @useResult
  $Res call({
    String id,
    TaskTitleValue title,
    TaskDescriptionValue description,
    DateTime createdAt,
    DateTime? dueAt,
    TaskStatusEntity status,
    TaskManagerIdValue managerId,
    AssigneeIdValue? assigneeUserId,
  });
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res, $Val extends TaskEntity>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? dueAt = freezed,
    Object? status = null,
    Object? managerId = null,
    Object? assigneeUserId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as TaskTitleValue,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as TaskDescriptionValue,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dueAt: freezed == dueAt
                ? _value.dueAt
                : dueAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatusEntity,
            managerId: null == managerId
                ? _value.managerId
                : managerId // ignore: cast_nullable_to_non_nullable
                      as TaskManagerIdValue,
            assigneeUserId: freezed == assigneeUserId
                ? _value.assigneeUserId
                : assigneeUserId // ignore: cast_nullable_to_non_nullable
                      as AssigneeIdValue?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskEntityImplCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$$TaskEntityImplCopyWith(
    _$TaskEntityImpl value,
    $Res Function(_$TaskEntityImpl) then,
  ) = __$$TaskEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    TaskTitleValue title,
    TaskDescriptionValue description,
    DateTime createdAt,
    DateTime? dueAt,
    TaskStatusEntity status,
    TaskManagerIdValue managerId,
    AssigneeIdValue? assigneeUserId,
  });
}

/// @nodoc
class __$$TaskEntityImplCopyWithImpl<$Res>
    extends _$TaskEntityCopyWithImpl<$Res, _$TaskEntityImpl>
    implements _$$TaskEntityImplCopyWith<$Res> {
  __$$TaskEntityImplCopyWithImpl(
    _$TaskEntityImpl _value,
    $Res Function(_$TaskEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? dueAt = freezed,
    Object? status = null,
    Object? managerId = null,
    Object? assigneeUserId = freezed,
  }) {
    return _then(
      _$TaskEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as TaskTitleValue,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as TaskDescriptionValue,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dueAt: freezed == dueAt
            ? _value.dueAt
            : dueAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatusEntity,
        managerId: null == managerId
            ? _value.managerId
            : managerId // ignore: cast_nullable_to_non_nullable
                  as TaskManagerIdValue,
        assigneeUserId: freezed == assigneeUserId
            ? _value.assigneeUserId
            : assigneeUserId // ignore: cast_nullable_to_non_nullable
                  as AssigneeIdValue?,
      ),
    );
  }
}

/// @nodoc

class _$TaskEntityImpl implements _TaskEntity {
  const _$TaskEntityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.dueAt,
    this.status = TaskStatusEntity.pending,
    required this.managerId,
    this.assigneeUserId,
  });

  @override
  final String id;
  @override
  final TaskTitleValue title;
  @override
  final TaskDescriptionValue description;
  @override
  final DateTime createdAt;
  @override
  final DateTime? dueAt;
  @override
  @JsonKey()
  final TaskStatusEntity status;
  @override
  final TaskManagerIdValue managerId;
  // The Manager
  @override
  final AssigneeIdValue? assigneeUserId;

  @override
  String toString() {
    return 'TaskEntity(id: $id, title: $title, description: $description, createdAt: $createdAt, dueAt: $dueAt, status: $status, managerId: $managerId, assigneeUserId: $assigneeUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dueAt, dueAt) || other.dueAt == dueAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.assigneeUserId, assigneeUserId) ||
                other.assigneeUserId == assigneeUserId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    createdAt,
    dueAt,
    status,
    managerId,
    assigneeUserId,
  );

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      __$$TaskEntityImplCopyWithImpl<_$TaskEntityImpl>(this, _$identity);
}

abstract class _TaskEntity implements TaskEntity {
  const factory _TaskEntity({
    required final String id,
    required final TaskTitleValue title,
    required final TaskDescriptionValue description,
    required final DateTime createdAt,
    required final DateTime? dueAt,
    final TaskStatusEntity status,
    required final TaskManagerIdValue managerId,
    final AssigneeIdValue? assigneeUserId,
  }) = _$TaskEntityImpl;

  @override
  String get id;
  @override
  TaskTitleValue get title;
  @override
  TaskDescriptionValue get description;
  @override
  DateTime get createdAt;
  @override
  DateTime? get dueAt;
  @override
  TaskStatusEntity get status;
  @override
  TaskManagerIdValue get managerId; // The Manager
  @override
  AssigneeIdValue? get assigneeUserId;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
