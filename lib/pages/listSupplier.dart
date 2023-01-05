import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:test_app/components/appBar.dart';
import 'package:test_app/components/itemCard.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/repositories/datasource.dart';

class ListSupplier extends StatefulWidget {
  const ListSupplier({super.key});

  @override
  State<ListSupplier> createState() => _ListSupplierState();
}

class _ListSupplierState extends State<ListSupplier> {
  DataSource ds = DataSource();
  int currentPage = 1;
  int numOfPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COMPANY APP', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff3fbbc0),
        actions: [
          GestureDetector(
            onTap: () => setState(() {}),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: body(context),
    );
  }

  Future<Map<String, dynamic>> getSupplier(int page) async {
    var res = await ds.listSupplier(offset: page, limit: 5);
    if (numOfPage <= 1) {
      setState(() {
        numOfPage = res['total_page'];
      });
    }
    return res;
  }

  Widget body(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //cards of barang
            FutureBuilder(
              future: getSupplier(currentPage),
              builder: (context, snapshot) {
                var children = <Widget>[];
                if (snapshot.hasData) {
                  List<SupplierModel> barang = snapshot.data!['data'];
                  children = <Widget>[
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: barang.length,
                      itemBuilder: ((context, index) =>
                          itemsCard(barang[index], index)),
                    )
                  ];
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                }
                return Column(
                  children: children,
                );
              },
            ),
            //pagination
            Container(
                margin: const EdgeInsets.all(8.0),
                child: NumberPaginator(
                  numberPages: numOfPage,
                  onPageChange: (index) {
                    setState(() {
                      currentPage = index + 1;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget itemsCard(SupplierModel supp, int index) {
    return ItemCard(
      supplier: supp,
      no: (index + (5 * (currentPage - 1)) + 1),
      isProduk: false,
    );
  }
}
