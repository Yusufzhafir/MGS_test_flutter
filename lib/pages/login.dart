import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/pages/register.dart';
import 'package:test_app/repositories/datasource.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  DataSource ds = DataSource();

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('img/logo.png'),
      ),
    );

    final username = TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.name,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          showAlert(context, "Error",
              "Isi fields dengan benar dan pastikan data sudah benar.");
        }
        return null;
      }),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          showAlert(context, "Error",
              "Isi fields dengan benar dan pastikan data sudah benar.");
        }
        return null;
      }),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12))),
        onPressed: () async {
          if (usernameController.text.isEmpty ||
              passwordController.text.isEmpty) {
            showAlert(context, "Error",
                "Isi fields dengan benar dan pastikan data sudah benar.");
          }

          var response = await ds.login({
            "username": usernameController.text,
            "password": passwordController.text
          });

          if (response == "success") {
            // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => HomePage())),
                (route) => false);
          } else {
            showAlert(context, "Error", response);
          }
        },
        child: Text('Login', style: TextStyle(color: Colors.white)),
      ),
    );
    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 28, 138, 77)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Text('Register Pasien', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerButton
          ],
        ),
      ),
    );
  }

  void showAlert(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
}
