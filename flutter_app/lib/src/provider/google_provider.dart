// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/src/features/screens/home_view/btm_nav/btm_nav.dart';
// import 'package:flutter_app/src/features/screens/login_view/login_page.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../common_widgets/custom_snackbar.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();

//   String? gphoto;
//   String? gemail;
//   String? gname;

//   GoogleSignInAccount? _user;

//   GoogleSignInAccount get user => _user!;

//   Future googleLogin({required BuildContext context}) async {
//     try {
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return;
//       _user = googleUser;

//       final googleAuth = await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'account-exists-with-different-credential') {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           customSnackBar(
//             content: 'The account already exists with a different credential',
//           ),
//         );
//       } else if (e.code == 'invalid-credential') {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           customSnackBar(
//             content: 'Error occurred while accessing credentials. Try again.',
//           ),
//         );
//       }
//     } catch (e) {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         customSnackBar(
//             content: 'Error occurred using Google Sign In. Try again.'),
//       );
//     }
//     if (_user != null) {
//       gphoto = user.photoUrl;
//       gemail = user.email;
//       gname = user.displayName;
//     }

//     // ignore: use_build_context_synchronously
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BtmNav()));

//     print('user signin with google ');

//     notifyListeners();
//   }

//   Future googleLogout({required BuildContext context}) async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();

//     gemail = null;
//     gphoto = null;
//     gname = null;

//     // ignore: use_build_context_synchronously
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

//     print('User signout of google');
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/features/screens/home_view/btm_nav/btm_nav.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Authentication {

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BtmNav(
          ),
        ),
      );
    }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

}
