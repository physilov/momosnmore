import 'package:flutter/material.dart';
import 'package:momos_and_more/CustomModels/ItemModel.dart';

class ItemProvider with ChangeNotifier{
  List<ItemModel> items = [];
}