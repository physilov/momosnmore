class ItemModel{
  ItemModel(this._id, this._name, this._price, this._category);

  static const ID = "id";
  static const NAME = "name";
  static const VALUE = "value";
  static const PRICE = "price";
  static const CATEGORY = "category";

  String _id;
  String _name;
  bool _value = false;
  String _price;
  String _category;

  String get id => _id;
  String get name => _name;
  //bool value => _value;
  String get price => _price;
  String get category => _category;

  static const ITEMS = 'items';




}

final List<ItemModel> items = [
  ItemModel("1","Chicken","8.50","Protein", ),
  ItemModel("2", "Pork","9.50","Protein", ),
  ItemModel("2", "White Rice","9.50","Carbs", ),
  ItemModel("2", "Brown Rice","9.50","Carbs", ),
  ItemModel("2", "Quinoa","9.50","Carbs", ),
  ItemModel("2", "Quinoa","9.50","Sauce", ),


];





