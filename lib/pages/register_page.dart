import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../utils/fire_auth.dart';
import '../utils/validator.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  
  void register() async {
    if (_registerFormKey.currentState!.validate()) {
      User? user = await FireAuth.registerUsingEmailPassword(
        name: _nameTextController.text,
        email: _emailTextController.text,
        password:_passwordTextController.text,
      );

      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MyHomePage(user: user),
          ),
          ModalRoute.withName('/'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Registro'),
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameTextController,
                      validator: (value) => Validator.validateName(name: value),
                      decoration: const InputDecoration(hintText: "Name"),
                    ),

                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailTextController,
                      validator: (value) => Validator.validateEmail(email: value),
                      decoration: const InputDecoration(hintText: "Email"),
                    ),

                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      validator: (value) => Validator.validatePassword(password: value),
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white, 
                      ),
                      child: const Text('Sign up'),
                    ) ,
                  ],
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}
