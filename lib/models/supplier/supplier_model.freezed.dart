// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupplierModel _$SupplierModelFromJson(Map<String, dynamic> json) {
  return _SupplierModel.fromJson(json);
}

/// @nodoc
mixin _$SupplierModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'namaSupplier')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'alamat')
  String get alamat => throw _privateConstructorUsedError;
  @JsonKey(name: 'noTelp')
  String get noTelfon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupplierModelCopyWith<SupplierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierModelCopyWith<$Res> {
  factory $SupplierModelCopyWith(
          SupplierModel value, $Res Function(SupplierModel) then) =
      _$SupplierModelCopyWithImpl<$Res, SupplierModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'namaSupplier') String nama,
      @JsonKey(name: 'alamat') String alamat,
      @JsonKey(name: 'noTelp') String noTelfon});
}

/// @nodoc
class _$SupplierModelCopyWithImpl<$Res, $Val extends SupplierModel>
    implements $SupplierModelCopyWith<$Res> {
  _$SupplierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? alamat = null,
    Object? noTelfon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      noTelfon: null == noTelfon
          ? _value.noTelfon
          : noTelfon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupplierModelCopyWith<$Res>
    implements $SupplierModelCopyWith<$Res> {
  factory _$$_SupplierModelCopyWith(
          _$_SupplierModel value, $Res Function(_$_SupplierModel) then) =
      __$$_SupplierModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'namaSupplier') String nama,
      @JsonKey(name: 'alamat') String alamat,
      @JsonKey(name: 'noTelp') String noTelfon});
}

/// @nodoc
class __$$_SupplierModelCopyWithImpl<$Res>
    extends _$SupplierModelCopyWithImpl<$Res, _$_SupplierModel>
    implements _$$_SupplierModelCopyWith<$Res> {
  __$$_SupplierModelCopyWithImpl(
      _$_SupplierModel _value, $Res Function(_$_SupplierModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? alamat = null,
    Object? noTelfon = null,
  }) {
    return _then(_$_SupplierModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      noTelfon: null == noTelfon
          ? _value.noTelfon
          : noTelfon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupplierModel implements _SupplierModel {
  const _$_SupplierModel(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'namaSupplier') required this.nama,
      @JsonKey(name: 'alamat') required this.alamat,
      @JsonKey(name: 'noTelp') required this.noTelfon});

  factory _$_SupplierModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupplierModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'namaSupplier')
  final String nama;
  @override
  @JsonKey(name: 'alamat')
  final String alamat;
  @override
  @JsonKey(name: 'noTelp')
  final String noTelfon;

  @override
  String toString() {
    return 'SupplierModel(id: $id, nama: $nama, alamat: $alamat, noTelfon: $noTelfon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupplierModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.noTelfon, noTelfon) ||
                other.noTelfon == noTelfon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, alamat, noTelfon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupplierModelCopyWith<_$_SupplierModel> get copyWith =>
      __$$_SupplierModelCopyWithImpl<_$_SupplierModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupplierModelToJson(
      this,
    );
  }
}

abstract class _SupplierModel implements SupplierModel {
  const factory _SupplierModel(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'namaSupplier') required final String nama,
          @JsonKey(name: 'alamat') required final String alamat,
          @JsonKey(name: 'noTelp') required final String noTelfon}) =
      _$_SupplierModel;

  factory _SupplierModel.fromJson(Map<String, dynamic> json) =
      _$_SupplierModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'namaSupplier')
  String get nama;
  @override
  @JsonKey(name: 'alamat')
  String get alamat;
  @override
  @JsonKey(name: 'noTelp')
  String get noTelfon;
  @override
  @JsonKey(ignore: true)
  _$$_SupplierModelCopyWith<_$_SupplierModel> get copyWith =>
      throw _privateConstructorUsedError;
}
