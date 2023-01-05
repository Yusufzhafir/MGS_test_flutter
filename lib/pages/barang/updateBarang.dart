import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/components/appBar.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/models/produk/produk_model.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/repositories/datasource.dart';

class UpdateBarangPage extends StatefulWidget {
  const UpdateBarangPage({super.key, required this.produk});

  final ProdukModel produk;

  @override
  State<UpdateBarangPage> createState() => _UpdateBarangPageState();
}

class _UpdateBarangPageState extends State<UpdateBarangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().bar,
      body: body(context),
    );
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          const Text(
            "update Barang Form",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          _form(context),
          const SizedBox(height: 20),
          _submit(context),
        ]),
      ),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController searchSupplierController =
      TextEditingController();
  DataSource ds = DataSource();
  late SupplierModel chosen;

  Widget _submit(BuildContext context) {
    return ButtonToPage(
        onPressed: () async {
          var condition = nameController.text.isEmpty ||
              hargaController.text.isEmpty ||
              stokController.text.isEmpty;
          if (condition) {
            showSnackBar("fill all Fields", context);
            return;
          }
          var nama = nameController.text;
          var harga = hargaController.text;
          var stok = stokController.text;

          ProdukModel produk = ProdukModel(
              id: widget.produk.id,
              nama: nama,
              harga: int.parse(harga),
              stok: int.parse(stok),
              supplier: chosen);
          var response = await ds.updateBarang(produk);
          if (!response.toString().toLowerCase().contains("fail")) {
            showSnackBar("success update Barang", context);
            // Future.delayed(Duration(milliseconds: 200), () {});
            nameController.dispose();
            hargaController.dispose();
            stokController.dispose();
            Navigator.pop(context);
            return;
          }
          showSnackBar("something went wrong", context);
        },
        text: "Submit");
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.produk.nama;
    stokController.text = widget.produk.stok.toString();
    hargaController.text = widget.produk.harga.toString();
    chosen = widget.produk.supplier;
  }

  List<SupplierModel> listSupplier = [];

  Widget _form(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: hargaController,
              decoration: const InputDecoration(
                labelText: 'harga produk',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: stokController,
              decoration: const InputDecoration(
                labelText: 'stok produk',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                var res = await ds.listSupplier(
                    offset: 1, limit: 8, search: searchSupplierController.text);
                setState(() {
                  listSupplier = res['data'];
                });
              },
              controller: searchSupplierController,
              decoration: const InputDecoration(
                labelText: 'search supplier',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
                dropdownColor: Colors.grey,
                hint: Text(chosen.nama),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 36,
                items: listSupplier
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text(val.nama),
                        ))
                    .toList(),
                onChanged: ((value) {
                  setState(() {
                    chosen = value!;
                  });
                }))
          ],
        ),
      ),
    );
  }
}
