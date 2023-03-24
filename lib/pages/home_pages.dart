import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_new/servis/auth_servis.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  HomePages({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dasboard'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () => AuthServis().doLogout(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email   : ${user!.phoneNumber ?? '-'}'),
                    Text('Email   : ${user!.email ?? '-'}'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Uid     : ${user!.uid}'),
                    ),
                    user!.emailVerified
                        ? Text('Email sudah terverifikasi')
                        : Text('Email belum terverifikasi'),
                    user!.emailVerified
                        ? Container()
                        : GestureDetector(
                            onTap: () => AuthServis().doVerifikasi(),
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Center(
                                child: Text(
                                  'Verifikasi sekarang',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                          )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
