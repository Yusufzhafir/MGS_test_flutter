import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/produk/produk_model.dart';
import 'package:test_app/models/supplier/supplier_model.dart';
import 'package:test_app/models/user/user_model.dart';

class DataSource {
  final String BASE_URL = 'http://159.223.57.121:8090';

  Future<String> login(Map<String, String> params) async {
    String url = "$BASE_URL/auth/login";
    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': params['username'],
          'password': params['password'],
        }));

    if (response.statusCode != 200) {
      return "status ${response.statusCode}";
    }

    var body = json.decode(response.body);

    if (body['message'] == "LOGIN FAILED") {
      return body['message'];
    }
    var token = body['data']['token'];

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    preferences.setString('username', params['username']!);
    preferences.setString('password', params['password']!);
    return "success";
  }

  void loginSharedPrefferences() async {
    var shared = await SharedPreferences.getInstance();
    if (shared.containsKey('username') && shared.containsKey('password')) {
      var username = shared.getString('username');
      var password = shared.getString('password');
      login({"username": username!, "password": password!});
    }
  }

  Future<String> register(UserModel user) async {
    try {
      final json = jsonEncode(user.toJson());
      final response = await http.post(Uri.parse("$BASE_URL/auth/register"),
          headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
          body: json);

      final message = jsonDecode(response.body);
      print(json);
      if (message['message'] == "REGISTER SUCCESSFUL") {
        login({"password": user.password, "username": user.username});
      }
      return message['message'];
    } catch (error, stacktrace) {
      throw Exception(error.toString());
    }
  }

  Future<String?> getToken() async {
    final share = await SharedPreferences.getInstance();
    return share.getString("token");
  }

  void logout() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove('token');
  }

  Future<dynamic> listBarang(
      {required int offset,
      required int limit,
      @Default(null) String? search}) async {
    String url =
        "$BASE_URL/barang/find-all?limit=$limit&offset=$offset${search != null ? "&search=$search" : ""}";

    String? token = await getToken();
    if (token == null) {
      return;
    }
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);

    List<ProdukModel> listBarang = [];
    for (var barang in body['data']) {
      listBarang.add(ProdukModel.fromJson(barang));
    }
    body['data'] = listBarang;
    return body;
  }

  Future<dynamic> listSupplier(
      {required int offset,
      required int limit,
      @Default(null) String? search}) async {
    String url =
        "$BASE_URL/supplier/find-all?limit=$limit&offset=$offset${search != null ? "&search=$search" : ""}";

    String? token = await getToken();
    if (token == null) {
      return;
    }
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);

    List<SupplierModel> listSupplier = [];
    for (var supplier in body['data']) {
      listSupplier.add(SupplierModel.fromJson(supplier));
    }
    body['data'] = listSupplier;
    return body;
  }

  Future<String> tambahBarang(ProdukModel produk) async {
    String url = "$BASE_URL/barang/create";

    String? token = await getToken();

    if (token == null) {
      loginSharedPrefferences();
    }

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(produk));

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);
    var message = body['message'];

    return message;
  }

  Future<String> updateBarang(ProdukModel produk) async {
    String url = "$BASE_URL/barang/update/${produk.id}";

    String? token = await getToken();

    if (token == null) {
      loginSharedPrefferences();
      token = await getToken();
    }

    var response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(produk));

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);
    var message = body['message'];

    return message;
  }

  Future<String> tambahSupplier(SupplierModel supplier) async {
    String url = "$BASE_URL/supplier/create";

    String? token = await getToken();
    if (token == null) {
      loginSharedPrefferences();
    }
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(supplier));

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);
    var message = body['message'];

    return message;
  }

  Future<String> updateSupplier(SupplierModel supplier) async {
    String url = "$BASE_URL/supplier/update/${supplier.id}";

    String? token = await getToken();

    if (token == null) {
      loginSharedPrefferences();
    }

    var response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(supplier));

    if (response.statusCode != 200) {
      return "Failed ${response.statusCode}";
    }

    var body = jsonDecode(response.body);
    var message = body['message'];
    return message;
  }
}
