import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:test_app/components/appBar.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/components/itemCard.dart';
import 'package:test_app/models/produk/produk_model.dart';
import 'package:test_app/pages/login.dart';
import 'package:test_app/repositories/datasource.dart';

class ListBarang extends StatefulWidget {
  const ListBarang({super.key});

  @override
  State<ListBarang> createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  DataSource ds = DataSource();
  int currentPage = 1;
  int numOfPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

  Future<Map<String, dynamic>?> getBarang(int page) async {
    var res = await ds.listBarang(offset: page, limit: 5);
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
              future: getBarang(currentPage),
              builder: (context, snapshot) {
                var children = <Widget>[];
                if (snapshot.hasData) {
                  List<ProdukModel> barang = snapshot.data!['data'];
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

  Widget itemsCard(ProdukModel barang, int index) {
    return ItemCard(
      produk: barang,
      no: (index + (5 * (currentPage - 1)) + 1),
      isProduk: true,
    );
  }
}
