import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zestypantry/app/modules/home/views/home_view.dart';
import 'package:zestypantry/app/modules/login/views/login_view.dart';


class UserCheck extends StatefulWidget {
  static String routeName = "/userAuthentication";
  const UserCheck({Key? key}) : super(key: key);

  @override
  State<UserCheck> createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.signOut();
  }


  @override
  void dispose() {
    FirebaseAuth.instance.signOut();
  }

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
            return HomeView();
          }
          else{
            return const LoginView();
          }
        },
      ),
    );
  }
}
