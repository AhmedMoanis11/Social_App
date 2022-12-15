import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/regist/stateRegistor.dart';

import '../../models/UserModel.dart';

class CubitRegist extends Cubit<RegistState> {

  CubitRegist() :super(IntialStateRegist());

  static CubitRegist get(context) => BlocProvider.of(context);

  IconData isshow = Icons.visibility_off;
  bool shown = true;

  void PasswordShow() {
    if (shown) {
      isshow = Icons.visibility;
      shown = !shown;
      emit(showReistpass());
    }
    else {
      isshow = Icons.visibility_off;
      shown = !shown;
      emit(showReistpass());
    }
  }

  void Registor({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    print('kkkkk');
    emit(OnLoadingRegist());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserCreate(
          name: name,
          phone: phone,
          email: email,
          password: password,
          uId: value.user!.uid);

      emit(OnSucessRegist());
    }).catchError((e) {
      print(e.toString());
      emit(OnErrorRegist());
    });
  }


  void UserCreate

  ({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String uId,

})
{
  UserModel model=UserModel(
    name: name,
    phone: phone,
    email: email,
    password: password,
    uId: uId,
    image: 'https://m.media-amazon.com/images/I/41jLBhDISxL._SY355_.jpg',
    bio: 'Write your bio',
    IsEmailVerify: false,

  );

FirebaseFirestore.instance.
collection('users')
    .doc(uId).
set(model.toMap()).then((value) {
  emit(OnSucessCreateUserRegist());
}).catchError((e)
{
  print(e.toString());
  emit(OnErrorCreateUserRegist(e.toString()));
});

}











}




