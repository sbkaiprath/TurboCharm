import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turbocharm/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) {
        return false;
      }
      UserCredential result = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              accessToken: (await account.authentication).accessToken,
              idToken: (await account.authentication).idToken));
      User user = result.user;
      print(user);

      await DatabaseService(uid: user.uid).updateUserData('855d5');

      if (user == null) {
        return false;
      }
      return true;
    } catch (e) {
      print(e.toString());
      print("error gsi");
      return false;
    }
  }

  Future<bool> signOutGoogle() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      print("User Sign Out");
      return true;
    } catch (e) {
      print("error signout");
      print(e.toString());
      return false;
    }
  }

  // Future<String> signInWithGoogle() async {
  //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final UserCredential authResult =
  //       await _auth.signInWithCredential(credential);
  //   final User user = authResult.user;

  //   print("helloooooooooooooooooooooooooooooooooooooooooooooo");
  //   print(user);

  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);

  //   final User currentUser = _auth.currentUser;
  //   assert(user.uid == currentUser.uid);

  //   await DatabaseService(uid: user.uid).updateUserData('855d5');
  //   print(user);

  //   return 'signInWithGoogle succeeded: $user';
  // }
}
