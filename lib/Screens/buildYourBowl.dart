import 'package:flutter/material.dart';
import 'package:momos_and_more/CustomModels/ItemModel.dart';
import 'package:momos_and_more/CustomWidgets/customText.dart';
import 'package:grouped_list/grouped_list.dart';

class BuildYourBowl extends StatefulWidget {
  const BuildYourBowl({Key key}) : super(key: key);

  @override
  _BuildYourBowlState createState() => _BuildYourBowlState();
}

class _BuildYourBowlState extends State<BuildYourBowl> {



  /*List _items = [
    {'itemName': 'CHICKEN', 'category': 'PROTEIN',},
    {'itemName': 'PORK', 'category': 'PROTEIN'},
    {'itemName': 'LAMB', 'category': 'PROTEIN'},
    {'itemName': 'WHITE RICE', 'category': 'CARB'},
    {'itemName': 'BROWN RICE', 'category': 'CARB'},
    {'itemName': 'QUINOA', 'category': 'CARB'},
    {'itemName': 'TOMATO & ONION', 'category': 'SAUCE'},
    {'itemName': 'TIKKA MASALA', 'category': 'SAUCE'},
    {'itemName': 'CASHEW', 'category': 'SAUCE'},
    {'itemName': 'TANGY ALOO', 'category': 'SAUCE'},
    {'itemName': 'SAAG', 'category': 'SAUCE'},





  ];*/
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 0.0,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Build Your BOWL"),


                ],
              ),
            ),
            SizedBox(height: 10,),
            Image.asset("images/bowl.jpg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GroupedListView<dynamic, String>(
                elements: items,
                groupBy: (ItemModel) => ItemModel.category,
                //groupComparator: (value1, value2) =>value2.compareTo(value1),
                //itemComparator: (item1, item2) => item1['itemName'].compareTo(item2['itemName']),
                order: GroupedListOrder.ASC,
                useStickyGroupSeparators: false,
                shrinkWrap: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomText(
                    text: value,

                  ),
                ),
                itemBuilder: (c, element){
                  return Container(
                    child: CheckboxListTile(
                      secondary: Image.asset("images/chicken.jpg"),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      //leading: Icon(Icons.account_circle),
                      title: CustomText(text: ItemModel.NAME),

                      value: _value,
                      onChanged: (bool value){
                        setState((){
                          _value = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
     /* SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Build Your BOWL"),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Image.asset("images/bowl.jpg"),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2.0, color: Colors.black),
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: "CHOOSE YOUR PROTEIN OR VEGGIES"),
                      ),
                    ],
                  ),
                ),
              ),
              CheckboxListTile(
                secondary: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "CHICKEN"),
                subtitle: CustomText(text: "8.50"),
                value: _value,
                onChanged: (bool value){
                  setState((){
                    _value = value;
                  });
                },
              ),
              CheckboxListTile(
                secondary: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "PORK"),
                subtitle: CustomText(text: "9.50"),
                value: _value,
                onChanged: (bool newValue){
                  setState((){
                    _value = newValue;
                  });
                },
              ),
              CheckboxListTile(
                secondary: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "LAMB"),
                subtitle: CustomText(text: "11.50"),
                value: _value,
                onChanged: (bool value){
                  setState((){
                    _value = value;
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.black),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: "CHOOSE YOUR CARBS"),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "White Rice"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "Brown Rice"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "Quinoa"),
                subtitle: CustomText(text: "130 cal"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.black),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: "MAKE IT SAUCY"),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "TOMATO & ONION"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "TIKKA MASALA"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "CASHEW"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "TANGY ALOO"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "SAAG"),
                subtitle: CustomText(text: "130 cal"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0, color: Colors.black),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(text: "DRINKS"),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "MANGO LASSI"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "COKE"),
                subtitle: CustomText(text: "130 cal"),
              ),
              ListTile(
                leading: Image.asset("images/chicken.jpg"),
                title: CustomText(text: "SPARKLING WATER"),
                subtitle: CustomText(text: "130 cal", colors: Colors.grey,),
              ),

            ],

          ),




        ),
      ),*/

    );

  }
}
