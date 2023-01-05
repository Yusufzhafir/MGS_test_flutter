// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/user/user_model.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/repositories/datasource.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  static String id = '/RegisterPage';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      resizeToAvoidBottomInset: false,
      body: registerbodypage(context),
    );
  }

  Widget registerbodypage(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset('img/about.jpg'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headerSection(),
                    _formField(context),
                    submitButton(),
                    signIn(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column headerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register',
          style: TextStyle(fontSize: 50.0),
        ),
        Text(
          'Lets get',
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'you on board',
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }

  Row signIn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(fontSize: 25.0),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            ' Sign In',
            style: TextStyle(fontSize: 25.0, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  CupertinoButton submitButton() {
    return CupertinoButton(
        color: Colors.cyan,
        child: Text(
          'Register',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        onPressed: () async {
          var values = {
            "username": userNameController.text,
            "name": nameController.text,
            "password": passwordController.text,
          };
          if (values.values.contains("")) {
            showSnackBar("value must not be empty", context);
            return;
          }
          var token = await register(values);
          if (token == "REGISTER SUCCESSFUL") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                (route) => route.isFirst);
          }
          showSnackBar(token, context);
        });
  }

  DataSource dataSource = DataSource();

  Future<String> register(Map<String, dynamic> values) async {
    UserModel pasien = UserModel(
      profileName: values["name"],
      username: values["username"],
      password: values["password"],
    );
    try {
      var token = await dataSource.register(pasien);
      return token;
    } catch (error) {
      showSnackBar(error.toString(), context);
      return "failed";
    }
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Widget _formField(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.name,
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
