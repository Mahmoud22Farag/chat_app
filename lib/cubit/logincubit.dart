import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginstate.dart';

class login extends Cubit<loginstate>{
  login() : super(loginintial());

  Future<void> loginUser({required String email,required String password}) async {
    emit(lodinglogin());
    try{
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email! , password: password! );
    emit(succsselogin());
  }on Exception catch(e){
      emit(failerlogin());
    }
  }
}