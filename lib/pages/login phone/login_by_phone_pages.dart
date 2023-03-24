import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_new/pages/login%20phone/verifikasi_phone.dart';
import 'package:firebase_auth_new/servis/auth_servis.dart';
import 'package:flutter/material.dart';

class LoginByPhonePages extends StatefulWidget {
  const LoginByPhonePages({super.key, required this.toLoginPages});

  final VoidCallback toLoginPages;

  static String verificationId = '';

  @override
  State<LoginByPhonePages> createState() => _LoginByPhonePagesState();
}

class _LoginByPhonePagesState extends State<LoginByPhonePages> {
  final phoneController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    phoneController.text = '+62';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: widget.toLoginPages, child: Icon(Icons.arrow_back)),
          title: Text('Input Your Number Phone'),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Number'),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthServis().signWithPhone(
                    phoneController.text.trim(),
                    (credential) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    },
                    (eror) {},
                    (verificationId, resendToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationPhone(),
                          ));
                    },
                    (verificationId) {
                      LoginByPhonePages.verificationId = verificationId;
                    });
                /*  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneController.text.trim(),
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print(e.toString());
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyVerify(),
                          ));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      LoginByPhonePages.verificationId = verificationId;
                    }); */
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    'Enter',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
