// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/provider/google_provider.dart';

import '../../../common_widgets/google_sigin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // final gp = Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sign in',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'ADLaMDisplay',
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              const Row(
                children: [
                  Text('To ',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'ADLaMDisplay',
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  Text('Price Bazzar',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'ADLaMDisplay',
                          color: bckgnd,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const Text('to access History of Products, Great Offers & etc.',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.32,
                width: MediaQuery.of(context).size.width,
                child: const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
              const Spacer(),
              // SignInButtonBuilder(
              //   backgroundColor: const Color(0xff41557D), 
              //   image: Image.asset('assets/images/google.png',width: 30,height: 30,),
              //   height: MediaQuery.of(context).size.height*0.08,
              //   width: MediaQuery.of(context).size.width,
              //   fontSize: 20,
              //   textColor: Colors.white,
              //   text: 'Sign in with Google',
              //   onPressed: () {
              //     GoogleSignInProvider().googleLogin(context: context);
                  
              //   },             
              // ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFF57C00),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
