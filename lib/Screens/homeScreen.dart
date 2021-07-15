import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:momos_and_more/CustomWidgets/customText.dart';
import 'package:momos_and_more/Screens/registerScreen.dart';
import 'package:momos_and_more/Screens/signInScreen.dart';
import 'package:momos_and_more/helpers/changeScreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:momos_and_more/Screens/buildYourBowl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _scrollingList(ScrollController sc){
    return Container(
      color: Colors.blueGrey,
      child: ListView.builder(
        controller: sc,
        itemCount: 20,
        itemBuilder: (BuildContext context, int i){
          return ListTile(
            title: CustomText(text: "Hello", colors: Colors.green,),
          );
        },
      ),
    );
  }



  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
        leading: IconButton(icon: Icon(Icons.person, color: Colors.lightGreen,),),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.lightGreen,)
          ),

        ],
        //title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        panelBuilder: (ScrollController sc) => _scrollingList(sc),
        color: Colors.grey[300],

        maxHeight: 1000,
        minHeight: 75,
        backdropEnabled: true,
        //snapPoint: 0.9,
        //header: Center(child: CustomText(text: "BACK",)),
        panel: Container(
          color: Colors.white,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [

                    CustomText(text: "BACK",),
                    Icon(Icons.keyboard_arrow_down, color: Colors.green,),

                    //IconButton(icon: Icon(Icons.keyboard_arrow_down, color: Colors.green,),),
                  ],
                ),
              ),

            ],
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),


          ),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.remove, color: Colors.grey, size: 24,),
                CustomText(text: "MENU", colors: Colors.lightGreen,),
              ],
            )
          ),
        ),
          body: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                SizedBox(height: 200,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Column(
                            children: [
                              CustomText(text: "JOIN MOMOS & GET MORE", size: 20, colors: Colors.green[800],),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(text: "   Login or Create a account to order \n your food and access all the benefits", colors: Colors.lightGreen,),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green[800]),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                        onTap: (){
                                          changeScreen(context, RegisterScreen());
                                        },
                                        child: CustomText(text: "CREATE ACCOUNT", colors: Colors.lightGreen, size: 12,)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.lightGreen),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.lightGreen,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                        onTap: (){
                                          changeScreen(context, LoginScreen());
                                        },
                                        child: CustomText(text: "SIGN IN", colors: Colors.white,)),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),

    );
  }


}
