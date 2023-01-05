import 'package:flutter/material.dart';
import 'package:test_app/components/appBar.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/models/produk/produk_model.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/repositories/datasource.dart';

class AddBarangPage extends StatefulWidget {
  AddBarangPage({super.key});

  @override
  State<AddBarangPage> createState() => _AddBarangPageState();
}

class _AddBarangPageState extends State<AddBarangPage> {
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
            "add Barang Form",
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
  late SupplierModel supplier;
  DataSource ds = DataSource();

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
              nama: nama,
              harga: int.parse(harga),
              stok: int.parse(stok),
              supplier: supplier);
          var response = await ds.tambahBarang(produk);
          if (!response.toString().toLowerCase().contains("fail")) {
            showSnackBar("success adding Barang", context);
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
    supplier = SupplierModel(nama: "danone", alamat: "null", noTelfon: "null");
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
                hint: Text(supplier.nama),
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
                    supplier = value!;
                  });
                }))
          ],
        ),
      ),
    );
  }
}
