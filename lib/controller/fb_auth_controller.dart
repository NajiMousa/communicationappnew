
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FbAuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String verificationID = '';

  Future<bool> loginPhone({ required String phone}) async {
    try {
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (AuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
            },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception.message);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            verificationID = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
      return true;
    } on FirebaseAuthException catch (e) {
      // _controlAuthException(context: context, e: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Future<bool> logIn(String phone, BuildContext context) async {
  //   try {
  //     _firebaseAuth.verifyPhoneNumber(
  //         phoneNumber: phone,
  //         timeout: Duration(seconds: 60),
  //         verificationCompleted: (AuthCredential credential) async {
  //           await _firebaseAuth.signInWithCredential(credential);
  //         },
  //         verificationFailed: (FirebaseAuthException exception) {
  //           print(exception);
  //         },
  //         codeSent: (String verificationId, int? forceResendingToken) {},
  //         codeAutoRetrievalTimeout: (String verificationId) {});
  //   } on FirebaseAuthException catch (e) {
  //     // _controlAuthException(context: context, e: e);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return false;
  // }

  Future<bool> addCode(String code, BuildContext context) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: code);
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
