import 'package:flutter/material.dart';

class CategoryModel{

  String id;
  String name;

  CategoryModel({@required this.id, @required this.name});





}

List<CategoryModel> getCategory(){
  List<CategoryModel> category = [CategoryModel(id: "02",name: "Protein"),
  CategoryModel(id: "01", name: "Rice"),
  ];
  return category;
}