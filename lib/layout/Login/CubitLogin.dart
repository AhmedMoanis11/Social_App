import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/Login/stateLogin.dart';

class CubitSc extends Cubit<SocialApp> {
  CubitSc() : super(IntialStates());

  static CubitSc get(context) => BlocProvider.of(context);
  IconData isshow = Icons.visibility_off;
  bool shown = true;

  void PasswordShow() {
    if (shown) {
      isshow = Icons.visibility;
      shown = !shown;
      emit(showpass());
    } else {
      isshow = Icons.visibility_off;
      shown = !shown;
      emit(showpass());
    }
  }

  void GetLogin({
    required String email,
    required String password,
  }) {
    emit(onLoadingLogin());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).
    then((value) {
      print(value.user!.email);
      print(value.user!.uid);
    emit(onsucessLogin(value.user!.uid));
    }).catchError((error)
    {

      emit(onErrorLogin(error.toString()));
    });
  }
}
