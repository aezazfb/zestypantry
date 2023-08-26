import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:zestypantry/app/data/functionalities/firebaseMessaging.dart';
import 'package:zestypantry/app/routes/app_pages.dart';
import 'package:zestypantry/globalVariables.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Image(image: AssetImage(
                          'assets/imgs/zpLogo.png'
                      ),
                        height: 200,
                      ),
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Welcome To ZestyPantry', style: TextStyle(
                      //         fontSize: 23,
                      //         fontFamily: 'Montserrat',
                      //         fontWeight: FontWeight.w700
                      //     ),),
                      //     Text('.', style: TextStyle(
                      //         fontSize: 23,
                      //         fontFamily: 'Montserrat',
                      //         fontWeight: FontWeight.w900,
                      //         color: Color.fromRGBO(253, 121, 168, 1)
                      //     ),),
                      //   ],
                      // ),
                      //
                      // const SizedBox(
                      //   height: 40,
                      // ),

                      const Image(image: AssetImage(
                          'assets/imgs/doingGrocery.png'
                      ),
                        height: 200,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            // userName
                            TextFormField(
                              controller: controller.userTxtCtlr,
                              cursorColor: const Color.fromRGBO(234, 210, 239, 1),
                              decoration: InputDecoration(
                                hintText: 'UserName',
                                hintStyle: const TextStyle(
                                    color: Color.fromRGBO(186, 103, 200, 0.5)
                                ),
                                prefixIcon: const Icon(Icons.person,
                                  color: Color.fromRGBO(186, 103, 200, 0.5)
                                  ,),
                                fillColor: const Color.fromRGBO(234, 210, 239, 0.4),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // pswrd
                            Obx(() => TextFormField(
                              controller: controller.passwordTxtCtlr,
                              obscureText: controller.isObsecure.value,
                              cursorColor: const Color.fromRGBO(234, 210, 239, 1),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    color: Color.fromRGBO(186, 103, 200, 0.5)
                                ),
                                prefixIcon: const Icon(Icons.lock,
                                  color: Color.fromRGBO(186, 103, 200, 0.5)
                                  ,),
                                suffixIcon: IconButton(
                                  onPressed: ()
                                  {
                                    controller.eyeSwitch();
                                  },
                                  icon: Icon(controller.isObsecure.value ? Icons.remove_red_eye : Icons.visibility_off,
                                      color: const Color.fromRGBO(186, 103, 200, 0.3)),
                                ),
                                fillColor: const Color.fromRGBO(234, 210, 239, 0.4),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),),

                            const SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (){
                                  // Get.toNamed(Routes.HOME);
                                  controller.signIn();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      )),
                                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(253, 121, 168, 1)),

                                ),
                                child: const Text('LOGIN'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(100)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?', style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color.fromRGBO(253, 121, 168, 1)
                      ),),
                      TextButton(
                          onPressed: ()
                          {
                            controller.scaffoldKey.currentState!.showBottomSheet(
                                  (context) => Container(
                                height: 650,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(240, 240, 240, 1),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30)
                                    )
                                ),
                                width: double.infinity,
                                child:
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                      child: Container(
                                        child: Center(
                                          child: Container(
                                            height: 8.0,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Welcome', style: TextStyle(
                                                    fontSize: 23,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w700
                                                ),),
                                                Text('.', style: TextStyle(
                                                    fontSize: 23,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromRGBO(253, 121, 168, 1)
                                                ),),
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 40,
                                            ),

                                            const Image(image: AssetImage(
                                                'assets/imgs/doingGrocery.png'
                                            ),
                                              height: 200,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.all(40.0),
                                              child: Column(
                                                children: [
                                                  //email
                                                  TextFormField(
                                                    cursorColor: const Color.fromRGBO(234, 210, 239, 1),
                                                    controller: controller.emailSignUpTxtCtlr,
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                      hintText: 'Email',
                                                      hintStyle: const TextStyle(
                                                          color: Color.fromRGBO(186, 103, 200, 0.5)
                                                      ),
                                                      prefixIcon: const Icon(Icons.email_rounded,
                                                        color: Color.fromRGBO(186, 103, 200, 0.5)
                                                        ,),
                                                      fillColor: const Color.fromRGBO(234, 210, 239, 0.4),
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(30),
                                                        borderSide: BorderSide.none,
                                                      ),
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // userName
                                                  TextFormField(
                                                    cursorColor: const Color.fromRGBO(234, 210, 239, 1),
                                                    controller: controller.userSignUpTxtCtlr,
                                                    decoration: InputDecoration(
                                                      hintText: 'UserName',
                                                      hintStyle: const TextStyle(
                                                          color: Color.fromRGBO(186, 103, 200, 0.5)
                                                      ),
                                                      prefixIcon: const Icon(Icons.person,
                                                        color: Color.fromRGBO(186, 103, 200, 0.5)
                                                        ,),
                                                      fillColor: const Color.fromRGBO(234, 210, 239, 0.4),
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(30),
                                                        borderSide: BorderSide.none,
                                                      ),
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // pswrd
                                                  Obx(() => TextFormField(
                                                    obscureText: controller.isObsecure.value,
                                                    controller: controller.passwordSignUpTxtCtlr,
                                                    cursorColor: const Color.fromRGBO(234, 210, 239, 1),
                                                    decoration: InputDecoration(
                                                      hintText: 'Password',
                                                      hintStyle: const TextStyle(
                                                          color: Color.fromRGBO(186, 103, 200, 0.5)
                                                      ),
                                                      prefixIcon: const Icon(Icons.lock,
                                                        color: Color.fromRGBO(186, 103, 200, 0.5)
                                                        ,),
                                                      suffixIcon: IconButton(
                                                        onPressed: ()
                                                        {
                                                          controller.eyeSwitch();
                                                        },
                                                        icon: Icon(controller.isObsecure.value ? Icons.remove_red_eye : Icons.visibility_off,
                                                            color: const Color.fromRGBO(186, 103, 200, 0.3)),
                                                      ),
                                                      fillColor: const Color.fromRGBO(234, 210, 239, 0.4),
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(30),
                                                        borderSide: BorderSide.none,
                                                      ),
                                                    ),
                                                  )),

                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  SizedBox(
                                                    height: 50,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: controller.emailSignUpTxtCtlr.text.trim(), password: controller.passwordSignUpTxtCtlr.text.trim());
                                                        FirebaseApi().createPushNotification("New User", "New registration received!", await FirebaseApi().generateAccessToken(), adminDeviceFcm);
                                                        //Get.toNamed(Routes.HOME);
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                            )),
                                                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(253, 121, 168, 1)),

                                                      ),
                                                      child: const Text('Sign Up'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              backgroundColor: Colors.transparent,
                            );
                          },
                          child: const Text('Sign Up', style: TextStyle(
                            color: Color.fromRGBO(253, 121, 168, 1),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),)
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
