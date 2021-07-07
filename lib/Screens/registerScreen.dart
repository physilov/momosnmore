import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momos_and_more/CustomWidgets/customText.dart';
import 'package:momos_and_more/Screens/signInScreen.dart';
import 'package:momos_and_more/helpers/changeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int id = 1;
  String radioButtonItem = 'YES';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "CREATE ACCOUNT", weight: FontWeight.bold, size: 20,),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              width: 300,

              child: Center(child: CustomText(text: "Create an account so you can order and \n                        enjoy promotions")),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,4),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                    hintText: "First Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,4),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Last Name",

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,4),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                    hintText: "Email Address"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,4),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Password",

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,18,8),
                  child: CustomText(text: "Please provide a strong password.", colors: Colors.green[800], size: 12,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,4),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Phone Number",

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,18,8),
                  child: CustomText(text: "For security and order related questions", colors: Colors.green[800], size: 12,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,12,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(text: "Receive text offers and promotions?"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,18,0),
              child: Row(
                children: [
                  Radio(value: 1, groupValue: id, onChanged: (val){
                    setState(() {
                      radioButtonItem = 'Yes';
                      id = 1;
                    });
                  },),
                  CustomText(text: "YES"),
                  Radio(value: 2, groupValue: id, onChanged: (val){
                    setState(() {
                      radioButtonItem = 'NO';
                      id = 2;
                    });
                  },),
                  CustomText(text: "NO"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,4,18,0),
              child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                    hintText: "Birthday(optional)"
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,18,8),
                  child: CustomText(text: "So we can send you treats", colors: Colors.green[800], size: 12,),
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
                  child: CustomText(text: "CREATE ACCOUNT", colors: Colors.white,),
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
                onTap: (){
                  changeScreen(context, LoginScreen());
                },
                child: CustomText(text: "SIGN IN", colors: Colors.green[800],)),

          ],
        )
      ),
    );
  }
}
