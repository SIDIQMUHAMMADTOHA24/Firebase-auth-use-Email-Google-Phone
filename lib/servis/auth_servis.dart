import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthServis {
  //Sigin
  doSign(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('berhasil');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('email sudah terdaftar');
      } else {
        print(e.toString());
        print('sabar ya semua demi kamu bisa berkembang ');
      }
    }
  }

  //Login
  doLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('berhasil');
    } catch (e) {
      print(e.toString());
      print('sabar ya semua demi kamu bisa berkembang ');
    }
  }

  doLogout() async {
    await FirebaseAuth.instance.signOut();
  }

  //reset password
  doResetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      print('berhasil dikkirim');
      // Melakukan proses autentikasi Firebase di sini
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        // Menangani error jika alamat email tidak valid
        print('Alamat email tidak valid.');
      } else if (e.code == 'auth/missing-android-pkg-name') {
        // Menangani error jika nama paket Android tidak diberikan
        print('Nama paket Android tidak diberikan.');
      } else if (e.code == 'auth/missing-continue-uri') {
        // Menangani error jika URL lanjutan tidak diberikan
        print('URL lanjutan tidak diberikan.');
      } else if (e.code == 'auth/missing-ios-bundle-id') {
        // Menangani error jika ID Bundle iOS tidak diberikan
        print('ID Bundle iOS tidak diberikan.');
      } else if (e.code == 'auth/invalid-continue-uri') {
        // Menangani error jika URL lanjutan tidak valid
        print('URL lanjutan tidak valid.');
      } else if (e.code == 'auth/unauthorized-continue-uri') {
        // Menangani error jika domain URL lanjutan tidak diizinkan
        print('Domain URL lanjutan tidak diizinkan.');
      } else if (e.code == 'auth/user-not-found') {
        // Menangani error jika pengguna tidak ditemukan
        print('Pengguna tidak ditemukan.');
      }
    }
  }

  //verifikasi email

  doVerifikasi() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    print(
        'pastika alamat email benar dan sesuai yang ada , pesan hanya kan terkirim ke alamat email, tidak termasuk demo dll');
  }

  //sign by google
  signWithGoogle() async {
    GoogleSignIn googleSign = GoogleSignIn(scopes: ['email']);

    try {
      await googleSign.disconnect();
    } catch (_) {}
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final cridensial = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      return FirebaseAuth.instance.signInWithCredential(cridensial);
    } catch (e) {
      print(e.toString());
    }
  }

  signWithPhone(
    String noTelephone,
    Function(PhoneAuthCredential) verificationCompleted,
    Function(FirebaseAuthException) verificationFailed,
    Function(String, int?) codeSent,
    Function(String) codeAutoRetrievalTimeout,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: noTelephone,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
