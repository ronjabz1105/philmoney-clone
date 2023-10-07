import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  var obscureText = true.obs;

  var firebaseAuth = FirebaseAuth.instance;
  var verificationCode = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    //phoneNumberController = TextEditingController();

    print('on init login');
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    // await firebaseAuth.signInWithPhoneNumber(phoneNumberController.text);

    print(
        '${phoneNumberController.text} ${passwordController.text} login here');
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!
          // await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provider phone number is not valid.');
          } else {
            print('The the code is ${e.code}');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          // String smsCode = 'xxxx';
          print('id is $verificationId');
          // Create a PhoneAuthCredential with the code
          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          // await firebaseAuth.signInWithCredential(credential);
        },
        timeout: const Duration(seconds: 30),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print('no error');
    } catch (e) {
      print('//////// errorr ////////// \n$e');
    }
  }
}
