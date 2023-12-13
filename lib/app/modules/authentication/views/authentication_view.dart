import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/modules/home/views/home_view.dart';
import 'package:zestypantry/app/modules/login/views/login_view.dart';
import 'package:zestypantry/app/modules/mainmenu/views/mainmenu_view.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return const MainmenuView();
          }
          else{
            return const LoginView();
          }
        },
      ),
    );
  }
}
