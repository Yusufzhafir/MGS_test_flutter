// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProdukModel _$$_ProdukModelFromJson(Map<String, dynamic> json) =>
    _$_ProdukModel(
      id: json['id'] as int? ?? 0,
      nama: json['namaBarang'] as String,
      harga: json['harga'] as int,
      stok: json['stok'] as int,
      supplier:
          SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProdukModelToJson(_$_ProdukModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaBarang': instance.nama,
      'harga': instance.harga,
      'stok': instance.stok,
      'supplier': instance.supplier,
    };
