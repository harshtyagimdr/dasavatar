import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dasavatar_app/model/user.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<User> getUser({String id}) async {
    String uid = id ?? await preferenceService.getUID();
    print(uid);
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('user_details').doc(uid).get();
    print(documentSnapshot.data());
    User user = User.fromJson(documentSnapshot.data());
    return user;
  }

  Future<User> setUser({User user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').doc(user.uid);
    String token = await _firebaseMessaging.getToken();
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print("User exist");
        User data = User.fromJson(documentSnapshot.data());
        data.deviceToken = token;
        await documentReference.update(User.toJson(data));
        user = data;
      } else {
        user.createdAt = DateTime.now().toString();
        user.deviceToken = token;
        await documentReference.set(User.toJson(user));
        print("User added");
      }
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUser({User user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').doc(user.uid);
    var data = User.toJson(user);
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print(data);
        documentReference.update(data);
        print("User updated");
      } else {
        await documentReference.set(data);
        print("User added");
      }
    } catch (e) {
      throw e;
    }
  }
}
