

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:momos_and_more/CustomModels/userModel.dart';
import 'package:momos_and_more/helpers/userServices.dart';
import 'package:momos_and_more/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserModel _userModel;
  UserServices _userServices = UserServices();

  Status get status => _status;
  User get user => _user;
  UserModel get userModel => _userModel;

  final formKey = GlobalKey<FormState>();

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthday = TextEditingController();

  UserProvider.init(){
    _fireSetUp();
  }

  _fireSetUp() async {
    await initialization.then((value){
      auth.authStateChanges().listen(_onStateChanged);
    });
  }

  Future<void> _onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      initializeUserModel();
      Future.delayed(const Duration(seconds: 2), (){
        _status = Status.Authenticated;
      });

      // _userModel = await _userServices.getUserById(user.uid);
      //initializeUserModel();

    }
    notifyListeners();
  }

  Future<bool> initializeUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _userId = preferences.getString('id');
    _userModel = await _userServices.getUserById(_userId);
    notifyListeners();
    if(_userModel == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> signIn()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      final result = await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      //User user = result.user;
      await initializeUserModel();
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result) async {
        _user = result.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("id", _user.uid);
        if(!await _userServices.doesUserExist(_user.uid)){
          _userServices.createUser(
            id: _user.uid,
            name: _user.displayName,
            email: _user.email,
          );
          await initializeUserModel();
        } else {
          await initializeUserModel();
        }
        /*_firestore.collection("users").doc(result.user.uid).set({
          'name':name.text,
          'email':email.text,
          'id':result.user.uid,
          "likedFood": [],
          "likedRestaurants": []
        }
        );*/
      });
      assert(user != null);
      assert(await user.getIdToken() != null);

      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut()async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }



}