// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupplierModel _$$_SupplierModelFromJson(Map<String, dynamic> json) =>
    _$_SupplierModel(
      id: json['id'] as int? ?? 0,
      nama: json['namaSupplier'] as String,
      alamat: json['alamat'] as String,
      noTelfon: json['noTelp'] as String,
    );

Map<String, dynamic> _$$_SupplierModelToJson(_$_SupplierModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaSupplier': instance.nama,
      'alamat': instance.alamat,
      'noTelp': instance.noTelfon,
    };
