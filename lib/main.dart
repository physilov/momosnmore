import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momos_and_more/Screens/buildYourBowl.dart';
import 'package:momos_and_more/Screens/homeScreen.dart';
import 'package:momos_and_more/Screens/registerScreen.dart';
import 'package:momos_and_more/Screens/signInScreen.dart';
import 'package:provider/provider.dart';

import 'Providers/userProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.init()),
    //ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
   // ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    //ChangeNotifierProvider.value(value: AppProvider()),

  ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
        backgroundColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return LoginScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return BuildYourBowl();
      default: return LoginScreen();
    }

  }
}

