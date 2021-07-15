import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:momos_and_more/CustomModels/userModel.dart';

class UserServices{
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser({String id, String name, String email}) {
    _firestore.collection(collection).doc(id).set({
      "name" : name,
      "id" : id,
      "email" : email,
    });
  }

  Future<UserModel> getUserById(String id) => _firestore.collection(collection).doc(id).get().then((doc){
    return UserModel.fromDocumentSnapshot(doc);
  });

  Future<bool> doesUserExist(String id) async => _firestore
      .collection(collection)
      .doc(id)
      .get()
      .then((value) => value.exists);
}


