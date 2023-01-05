// namaSupplier
// alamat
// noTelp
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_model.freezed.dart';
part 'supplier_model.g.dart';

@freezed
class SupplierModel with _$SupplierModel {
  const factory SupplierModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'namaSupplier') required String nama,
    @JsonKey(name: 'alamat') required String alamat,
    @JsonKey(name: 'noTelp') required String noTelfon,
  }) = _SupplierModel;

  factory SupplierModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierModelFromJson(json);

  @override
  String toString() {
    // TODO: implement toString
    return this.nama;
  }
}
