import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'package:firebase_core/firebase_core.dart';
import 'package:maintenance_app/views/available_elec.dart';
import 'package:maintenance_app/views/electrician_reg.dart';

import 'package:maintenance_app/views/login.dart';

import 'package:maintenance_app/views/forgot.dart';
import 'package:maintenance_app/views/home.dart';
import 'package:maintenance_app/views/registered_as_elec.dart';
import 'package:maintenance_app/views/signup.dart';
import 'package:maintenance_app/views/work_fields.dart';

import 'models/user_model.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: FirebaseOptions(

      apiKey: "AIzaSyBv29BbXk3DCzGLR_uPl3f4rSNUZLBMQ4Q",
      authDomain: "test-project-for-ci-cd.firebaseapp.com",
      databaseURL: "https://test-project-for-ci-cd-default-rtdb.firebaseio.com",
      projectId: "test-project-for-ci-cd",
      storageBucket: "test-project-for-ci-cd.appspot.com",
      messagingSenderId: "287309597886",
      appId: "1:287309597886:web:0d42eacf52d4906fde22ef",
      measurementId: "G-0Q8S0RS828",
    ),
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'login': (context) => MyLogin(),
        'signup': (context) => MySignup(),
        'forgot': (context) => MyForgot(),
        'home': (context) => MyHome(),
        'work_fields': (context) => MyWork_Fields(),
        'electrician_reg': (context) => MyElectricianReg(),
        'registered_as_elec': (context) => MyRegistered_As_Elec(),
        'available_elec': (context) => MyAvailable_Elec(),
      },
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        UserModel? userModel = await _userController.getUserByEmail(user.email!);
        if (userModel != null) {
          Navigator.pushReplacementNamed(context, 'home', arguments: userModel);
        } else {
          print('User not found in Firestore');
          Navigator.pushReplacementNamed(context, 'login');
        }

      // Future<void> checkLoginStatus() async {
      //   User? user = FirebaseAuth.instance.currentUser;
      //   print('Here is the uid ${user?.uid}');
      //   await Future.delayed(Duration(seconds: 5), () {});
      //   if (user?.uid != null) {
      //     Navigator.pushReplacementNamed(context, 'home');
      //   }
      //   else {
      //     Navigator.pushReplacementNamed(context, 'login');
      //   }
    }
    }  );

    @override
    Widget build(BuildContext context) {
      return Scaffold(


        body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 100, width: 1300,),
              Image(
                height: 150,
                width: 100,
                image: AssetImage('assets/images/logo.png'),
              ),
              Text('Maintenance ',
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Rubik Medium',
                    color: Colors.black),
              ),
              Text(
                'Services',
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Rubik Medium',
                    color: Color(0xffF9703B)),
              )
            ]
        ),


      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _userController {
  static getUserByEmail(String s) {}
}
