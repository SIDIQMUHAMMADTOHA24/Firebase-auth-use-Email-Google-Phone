import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_new/pages/home_pages.dart';
import 'package:firebase_auth_new/pages/sign_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/select pages/select_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainMenu());
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  User? _user;

  onMain() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    onMain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _user == null ? SelectPages() : HomePages());
  }
}
