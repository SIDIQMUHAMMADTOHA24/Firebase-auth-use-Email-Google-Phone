import 'package:firebase_auth_new/servis/auth_servis.dart';
import 'package:flutter/material.dart';


class LoginByGoogle extends StatelessWidget {
  const LoginByGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AuthServis().signWithGoogle(),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: Image.network(
          'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
        ),
      ),
    );
  }
}
