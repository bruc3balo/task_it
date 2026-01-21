// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppUserEntity {
  AppUserIdValue get id => throw _privateConstructorUsedError;
  EmailAddressValue get email => throw _privateConstructorUsedError;
  DisplayNameValue get displayName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of AppUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserEntityCopyWith<AppUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserEntityCopyWith<$Res> {
  factory $AppUserEntityCopyWith(
    AppUserEntity value,
    $Res Function(AppUserEntity) then,
  ) = _$AppUserEntityCopyWithImpl<$Res, AppUserEntity>;
  @useResult
  $Res call({
    AppUserIdValue id,
    EmailAddressValue email,
    DisplayNameValue displayName,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$AppUserEntityCopyWithImpl<$Res, $Val extends AppUserEntity>
    implements $AppUserEntityCopyWith<$Res> {
  _$AppUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as AppUserIdValue,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as EmailAddressValue,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as DisplayNameValue,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppUserEntityImplCopyWith<$Res>
    implements $AppUserEntityCopyWith<$Res> {
  factory _$$AppUserEntityImplCopyWith(
    _$AppUserEntityImpl value,
    $Res Function(_$AppUserEntityImpl) then,
  ) = __$$AppUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AppUserIdValue id,
    EmailAddressValue email,
    DisplayNameValue displayName,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$AppUserEntityImplCopyWithImpl<$Res>
    extends _$AppUserEntityCopyWithImpl<$Res, _$AppUserEntityImpl>
    implements _$$AppUserEntityImplCopyWith<$Res> {
  __$$AppUserEntityImplCopyWithImpl(
    _$AppUserEntityImpl _value,
    $Res Function(_$AppUserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$AppUserEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as AppUserIdValue,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as EmailAddressValue,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as DisplayNameValue,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$AppUserEntityImpl implements _AppUserEntity {
  const _$AppUserEntityImpl({
    required this.id,
    required this.email,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  final AppUserIdValue id;
  @override
  final EmailAddressValue email;
  @override
  final DisplayNameValue displayName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AppUserEntity(id: $id, email: $email, displayName: $displayName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, displayName, createdAt, updatedAt);

  /// Create a copy of AppUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserEntityImplCopyWith<_$AppUserEntityImpl> get copyWith =>
      __$$AppUserEntityImplCopyWithImpl<_$AppUserEntityImpl>(this, _$identity);
}

abstract class _AppUserEntity implements AppUserEntity {
  const factory _AppUserEntity({
    required final AppUserIdValue id,
    required final EmailAddressValue email,
    required final DisplayNameValue displayName,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$AppUserEntityImpl;

  @override
  AppUserIdValue get id;
  @override
  EmailAddressValue get email;
  @override
  DisplayNameValue get displayName;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AppUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserEntityImplCopyWith<_$AppUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
