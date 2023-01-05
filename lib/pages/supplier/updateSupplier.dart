import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/components/appBar.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/repositories/datasource.dart';

class UpdateSupplierPage extends StatefulWidget {
  const UpdateSupplierPage({super.key, required this.supplier});

  final SupplierModel supplier;

  @override
  State<UpdateSupplierPage> createState() => _UpdateSupplierPageState();
}

class _UpdateSupplierPageState extends State<UpdateSupplierPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatTextController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  DataSource ds = DataSource();

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
            "update Supplier Form",
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

  Widget _submit(BuildContext context) {
    return ButtonToPage(
        onPressed: () async {
          var condition = nameController.text.isEmpty ||
              alamatTextController.text.isEmpty ||
              noTelpController.text.isEmpty;
          if (condition) {
            showSnackBar("fill all Fields", context);
            return;
          }
          var nama = nameController.text;
          var alamat = alamatTextController.text;
          var noTelp = noTelpController.text;

          SupplierModel supplier = SupplierModel(
              id: widget.supplier.id,
              nama: nama,
              alamat: alamat,
              noTelfon: noTelp);
          var response = await ds.updateSupplier(supplier);
          if (!response.toString().toLowerCase().contains("fail")) {
            showSnackBar("success updating supplier", context);
            Future.delayed(Duration(milliseconds: 200), () {});
            nameController.dispose();
            alamatTextController.dispose();
            noTelpController.dispose();
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
    nameController.text = widget.supplier.nama;
    alamatTextController.text = widget.supplier.alamat;
    noTelpController.text = widget.supplier.noTelfon;
  }

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
            const Text("Nama SUpplier"),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: alamatTextController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: noTelpController,
              decoration: const InputDecoration(
                labelText: 'Nomor Telfon',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
