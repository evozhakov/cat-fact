// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/models/user/user_model.dart';
import 'package:cats_fact/ui/widgets/dialogs/auth_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/utils.dart';

class AuthRepository {
  final userCollectionRef = FirebaseFirestore.instance.collection('users');
  final googleSignIn = GoogleSignIn();
  static Future<void> showAuthDialog(
      BuildContext context, FactModel fact) async {
    await showDialog(
      context: context,
      builder: (_) => AuthDialog(fact),
    );
  }

  Future<void> signIn(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      await createUser(context);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message!);
    }
  }

  Future<void> createUser(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser!;
    final userModel = UserModel(user.email!, user.uid);

    userCollectionRef.doc(user.uid).set(userModel.toJson());
    context.read<ServiceBloc>().add(SignInEvent(user));
  }

  Future<void> logOut(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
     context.read<ServiceBloc>().add(LogOutEvent());
    
  }
}

//
//
//
//
//
///
//
///


