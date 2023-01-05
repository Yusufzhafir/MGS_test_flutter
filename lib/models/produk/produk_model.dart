// namaBarang
// harga
// stok
// supplier
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/models/supplier/supplier_model.dart';

part 'produk_model.freezed.dart';
part 'produk_model.g.dart';

@freezed
class ProdukModel with _$ProdukModel {
  const factory ProdukModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'namaBarang') required String nama,
    @JsonKey(name: 'harga') required int harga,
    @JsonKey(name: 'stok') required int stok,
    @JsonKey(name: 'supplier') required SupplierModel supplier,
  }) = _ProdukModel;

  factory ProdukModel.fromJson(Map<String, dynamic> json) =>
      _$ProdukModelFromJson(json);
}
