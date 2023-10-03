import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime_database/pages/home.dart';
import './register_page.dart';
import '../utils/fire_auth.dart';
import '../utils/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void login() async {
    if (_formKey.currentState!.validate()) {
      User? user = await FireAuth.signInUsingEmailPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomePage(user: user),
          ),
        );
      }
    }
  }

  void register() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            Form(
              key: _formKey,
              child: Column(
                children: [

                  TextFormField(
                    controller: _emailTextController,
                    validator: (value) => Validator.validateEmail(email: value),
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(height: 8.0),
                  
                  TextFormField(
                    controller: _passwordTextController,
                    obscureText: true,
                    validator: (value) => Validator.validatePassword(password: value),
                    decoration: const InputDecoration(hintText: "Password"),
                  ),

                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white, 
                    ),
                    child: const Text('Login'),
                  ),

                  const SizedBox(width: 24.0),
                  ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white, 
                    ),
                    child: const Text('Registro'),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
