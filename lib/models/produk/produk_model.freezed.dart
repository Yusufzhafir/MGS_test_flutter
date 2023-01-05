// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produk_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProdukModel _$ProdukModelFromJson(Map<String, dynamic> json) {
  return _ProdukModel.fromJson(json);
}

/// @nodoc
mixin _$ProdukModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'namaBarang')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  int get harga => throw _privateConstructorUsedError;
  @JsonKey(name: 'stok')
  int get stok => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  SupplierModel get supplier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProdukModelCopyWith<ProdukModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProdukModelCopyWith<$Res> {
  factory $ProdukModelCopyWith(
          ProdukModel value, $Res Function(ProdukModel) then) =
      _$ProdukModelCopyWithImpl<$Res, ProdukModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'namaBarang') String nama,
      @JsonKey(name: 'harga') int harga,
      @JsonKey(name: 'stok') int stok,
      @JsonKey(name: 'supplier') SupplierModel supplier});

  $SupplierModelCopyWith<$Res> get supplier;
}

/// @nodoc
class _$ProdukModelCopyWithImpl<$Res, $Val extends ProdukModel>
    implements $ProdukModelCopyWith<$Res> {
  _$ProdukModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? harga = null,
    Object? stok = null,
    Object? supplier = null,
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
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      stok: null == stok
          ? _value.stok
          : stok // ignore: cast_nullable_to_non_nullable
              as int,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierModelCopyWith<$Res> get supplier {
    return $SupplierModelCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProdukModelCopyWith<$Res>
    implements $ProdukModelCopyWith<$Res> {
  factory _$$_ProdukModelCopyWith(
          _$_ProdukModel value, $Res Function(_$_ProdukModel) then) =
      __$$_ProdukModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'namaBarang') String nama,
      @JsonKey(name: 'harga') int harga,
      @JsonKey(name: 'stok') int stok,
      @JsonKey(name: 'supplier') SupplierModel supplier});

  @override
  $SupplierModelCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$_ProdukModelCopyWithImpl<$Res>
    extends _$ProdukModelCopyWithImpl<$Res, _$_ProdukModel>
    implements _$$_ProdukModelCopyWith<$Res> {
  __$$_ProdukModelCopyWithImpl(
      _$_ProdukModel _value, $Res Function(_$_ProdukModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? harga = null,
    Object? stok = null,
    Object? supplier = null,
  }) {
    return _then(_$_ProdukModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as int,
      stok: null == stok
          ? _value.stok
          : stok // ignore: cast_nullable_to_non_nullable
              as int,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProdukModel implements _ProdukModel {
  const _$_ProdukModel(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'namaBarang') required this.nama,
      @JsonKey(name: 'harga') required this.harga,
      @JsonKey(name: 'stok') required this.stok,
      @JsonKey(name: 'supplier') required this.supplier});

  factory _$_ProdukModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProdukModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'namaBarang')
  final String nama;
  @override
  @JsonKey(name: 'harga')
  final int harga;
  @override
  @JsonKey(name: 'stok')
  final int stok;
  @override
  @JsonKey(name: 'supplier')
  final SupplierModel supplier;

  @override
  String toString() {
    return 'ProdukModel(id: $id, nama: $nama, harga: $harga, stok: $stok, supplier: $supplier)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProdukModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.stok, stok) || other.stok == stok) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, harga, stok, supplier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProdukModelCopyWith<_$_ProdukModel> get copyWith =>
      __$$_ProdukModelCopyWithImpl<_$_ProdukModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProdukModelToJson(
      this,
    );
  }
}

abstract class _ProdukModel implements ProdukModel {
  const factory _ProdukModel(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'namaBarang') required final String nama,
          @JsonKey(name: 'harga') required final int harga,
          @JsonKey(name: 'stok') required final int stok,
          @JsonKey(name: 'supplier') required final SupplierModel supplier}) =
      _$_ProdukModel;

  factory _ProdukModel.fromJson(Map<String, dynamic> json) =
      _$_ProdukModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'namaBarang')
  String get nama;
  @override
  @JsonKey(name: 'harga')
  int get harga;
  @override
  @JsonKey(name: 'stok')
  int get stok;
  @override
  @JsonKey(name: 'supplier')
  SupplierModel get supplier;
  @override
  @JsonKey(ignore: true)
  _$$_ProdukModelCopyWith<_$_ProdukModel> get copyWith =>
      throw _privateConstructorUsedError;
}
