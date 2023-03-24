import 'package:firebase_auth_new/pages/login_pages.dart';
import 'package:firebase_auth_new/pages/sign_pages.dart';
import 'package:flutter/material.dart';

import '../login phone/login_by_phone_pages.dart';

//select pages login dan sign with email dan password
class SelectPages extends StatefulWidget {
  const SelectPages({super.key});

  @override
  State<SelectPages> createState() => _SelectPagesState();
}

class _SelectPagesState extends State<SelectPages> {
  bool isPagesNow = false;

  onPages() {
    isPagesNow = !isPagesNow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isPagesNow) {
      return SelectPagesSecond(
        thisSelectPagesSecond: () => onPages(),
      );
    }
    return SignPages(
      toLogin: () => onPages(),
    );
  }
}

//select pages login phone
class SelectPagesSecond extends StatefulWidget {
  const SelectPagesSecond({super.key, required this.thisSelectPagesSecond});
  final VoidCallback thisSelectPagesSecond;

  @override
  State<SelectPagesSecond> createState() => _SelectPagesSecondState();
}

class _SelectPagesSecondState extends State<SelectPagesSecond> {
  bool isPagesNow = true;

  onPages() {
    isPagesNow = !isPagesNow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isPagesNow) {
      return LoginPages(
        toRegister: widget.thisSelectPagesSecond,
        toPhone: () => onPages(),
      );
    }
    return LoginByPhonePages(
      toLoginPages: () => onPages(),
    );
  }
}
