import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/models/produk/produk_model.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/pages/barang/addBarang.dart';
import 'package:test_app/pages/barang/updateBarang.dart';
import 'package:test_app/pages/supplier/addSupplier.dart';
import 'package:test_app/pages/supplier/updateSupplier.dart';

class ItemCard extends StatelessWidget {
  ItemCard(
      {super.key,
      @Default(null) this.produk,
      @Default(null) this.supplier,
      required this.no,
      required this.isProduk});

  ProdukModel? produk;
  SupplierModel? supplier;
  final int no;
  final bool isProduk;

  @override
  Widget build(BuildContext context) {
    if (isProduk) {
      supplier = produk!.supplier;
    }
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              textBaseline: TextBaseline.alphabetic,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // nomor
                Text(
                  "$no.",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                // details produk
                infoProduk(),
                const SizedBox(
                  width: 20,
                ),
                //details supplier
                infoSupplier(),

                //action
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonToPage(
                  onPressed: () {
                    isProduk
                        ? redirectProduk(context, true)
                        : redirectSupplier(context, true);
                  },
                  text: "tambah",
                ),
                const SizedBox(
                  width: 20,
                ),
                ButtonToPage(
                  onPressed: () {
                    isProduk
                        ? redirectProduk(context, false)
                        : redirectSupplier(context, false);
                  },
                  text: "update",
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void redirectProduk(BuildContext context, bool isTambah) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => isTambah
                ? AddBarangPage()
                : UpdateBarangPage(produk: produk!)));
  }

  void redirectSupplier(BuildContext context, bool isTambah) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => isTambah
                ? const AddSupplierPage()
                : UpdateSupplierPage(
                    supplier: supplier!,
                  )));
  }

  Widget infoProduk() {
    return !isProduk
        ? const SizedBox()
        : Column(
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                produk!.nama,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "stok: ${produk!.stok}",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "harga: ${produk!.harga}",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
  }

  Column infoSupplier() {
    return Column(
      children: [
        Text(
          "supplier: ${supplier!.nama}",
          style:
              const TextStyle(color: Colors.white, overflow: TextOverflow.clip),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "alamat: ${supplier!.alamat}",
          style:
              const TextStyle(color: Colors.white, overflow: TextOverflow.clip),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "no. telp: ${supplier!.noTelfon}",
          style:
              const TextStyle(color: Colors.white, overflow: TextOverflow.clip),
        ),
      ],
    );
  }
}
