import 'package:flutter/material.dart';
import 'package:momos_and_more/CustomWidgets/customText.dart';
import 'package:momos_and_more/Screens/buildYourBowl.dart';
import 'package:momos_and_more/Screens/registerScreen.dart';
import 'package:momos_and_more/helpers/changeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.green[800],
            onPressed: (){
              Navigator.of(context).pop();
            },
          )

        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "SIGN IN", size: 18, weight: FontWeight.bold, colors: Colors.green[800],),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,8,18,8),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                    hintText: "Email Address"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                obscureText: true,
                controller: null,
                decoration: InputDecoration(
                    hintText: "Password",

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,8,18,8),
                  child: CustomText(text: "FORGOT PASSWORD", colors: Colors.green[800],),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: (){
                        changeScreen(context, BuildYourBowl());
                      },
                      child: CustomText(text: "SIGN IN", colors: Colors.white,)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
                onTap: (){
                  changeScreen(context, RegisterScreen());
                },
                child: CustomText(text: "CREATE ACCOUNT", colors: Colors.green[800],)),
          ],
        ),
      ),

    );
  }
}
