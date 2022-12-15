import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/mainSocial.dart';
import 'package:social_app/shared/constense.dart';
import 'package:social_app/layout/Home/cubitHome.dart';
import 'package:social_app/moduels/Splach_screen.dart';

import 'shared/BlocObserver.dart';
import 'shared/SharedPre.dart';
import 'layout/Login/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();
  var token= await FirebaseMessaging.instance.getToken();
  print(token);

  FirebaseMessaging.onMessage.listen((event) {
      print('on message');
    print(event.data.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on mesasge open app');
    print(event.data.toString());

  });

  uId = CasheHelper.getData(key: 'uId');

  Widget widget;
  if (uId != null) {
    widget = SocialHome();
  } else {
    widget = LoginSc();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  late final Widget startWidget;

  MyApp({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>CubitHome()..getDataHome()..GetDataPost()..GetAllUsers()),
     ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple.shade400,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.deepPurple.shade300,
              statusBarIconBrightness: Brightness.dark,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor:Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 300,
          splash:SplachScreen(),
          nextScreen:startWidget ,
            splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}


