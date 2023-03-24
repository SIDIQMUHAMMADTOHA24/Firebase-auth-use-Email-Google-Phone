import 'package:flutter/material.dart';

class LoginByPhone extends StatelessWidget {
  const LoginByPhone({
    super.key, required this.loginPages,
  });

  final VoidCallback loginPages;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loginPages,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: Center(
            child: Icon(
          Icons.phone,
          color: Colors.white,
        )),
      ),
    );
  }
}
