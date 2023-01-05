import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/components/button.dart';
import 'package:test_app/pages/listBarang.dart';
import 'package:test_app/pages/listSupplier.dart';
import 'package:test_app/pages/login.dart';
import 'package:test_app/repositories/datasource.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // String autToken;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isLoggedin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COMPANY APP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff3fbbc0),
      ),
      backgroundColor: Colors.white,
      body: HomeBody(context),
    );
  }

  Future<String?> getToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    return token;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => check(context));
  }

  void check(BuildContext context) async {
    var token = await getToken();
    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  Widget HomeBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: getToken(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return ListButtonToPage(context);
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text("Waiting");
                  }

                  return const Text("Loading");
                })),
          ],
        ),
      ),
    );
  }

  DataSource datasource = DataSource();
  Widget ListButtonToPage(BuildContext context) {
    return Column(
      children: [
        ButtonToPage(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ListBarang())));
            },
            text: "List Barang"),
        const SizedBox(height: 20),
        ButtonToPage(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ListSupplier())));
            },
            text: "List Supplier"),
        const SizedBox(
          height: 20,
        ),
        ButtonToPage(
            onPressed: () {
              datasource.logout();
              setState(() {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
              return;
            },
            text: "logout")
      ],
    );
  }
}
