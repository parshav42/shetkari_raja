import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendOtp(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store verificationId for later use
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  String? _verificationId;

  Future<UserCredential> verifyOtp(String otp, String phoneNumber) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    // Store user profile in Firestore
    if (userCredential.user != null) {
      await FirestoreService.instance.createOrUpdateUserProfile(
        uid: userCredential.user!.uid,
        phoneNumber: '+91$phoneNumber',
        role: 'farmer',
      );
    }
    return userCredential;
  }

  User? get currentUser => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
