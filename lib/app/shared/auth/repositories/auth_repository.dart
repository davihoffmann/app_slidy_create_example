import 'package:app_slidy_create/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future getEmailPasswordLogin() {
    throw UnimplementedError();
  }

  @override
  Future getFacebookLogin() {
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
        
    return user;
  }

  @override
  Future<String> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getUser() async {
    return _auth.currentUser();
  }

  @override
  Future logout() async {
    return _auth.signOut();
    //_googleSignIn.signOut();
  }
}
