import 'package:firebase_auth_new/pages/reset%20password/reset_password_pages.dart';
import 'package:firebase_auth_new/servis/auth_servis.dart';
import 'package:firebase_auth_new/utils/login_by_google_utils.dart';
import 'package:flutter/material.dart';

import '../utils/login_by_phone_utils.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key, required this.toRegister, required this.toPhone});

  final VoidCallback toRegister;
  final VoidCallback toPhone;

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Icon(
                  Icons.apple,
                  size: 150,
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordPages(),
                          )),
                      child: Text(
                        'Lupa password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  AuthServis().doLogin(emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Text('Not a account ?'),
                    Spacer(),
                    GestureDetector(
                      onTap: widget.toRegister,
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Or Login by : '),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Login by Telephone
                  LoginByPhone(loginPages: widget.toPhone),
                  SizedBox(
                    width: 10,
                  ),
                  LoginByGoogle()
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
