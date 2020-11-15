import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dasavatar_app/model/post.dart';

class PostService {
  PostService._();

  factory PostService.getInstance() => _instance;
  static final PostService _instance = PostService._();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getAllPost(Function addPostInStore) async {
    try {
      await _firestore.collection('posts').snapshots().listen((event) {
        event.docs.forEach((element) {
          addPostInStore(Post.fromJson(element.data()));
        });
        if (event.docs.isEmpty) {
          addPostInStore(null);
        }
      });
    } catch (e) {
      print("get all post in post service");
      print(e);
      throw e;
    }
  }

  Future uploadPost({Post post}) async {
    try {
      DocumentReference documentReference =
          _firestore.collection('posts').doc(post.id);
      await documentReference.set(Post.toJson(post));
    } catch (e) {
      print("upload post in post service");
      print(e);
      throw e;
    }
  }

  Future updatePost({Post post}) async {
    try {
      DocumentReference documentReference =
          _firestore.collection('posts').doc(post.id);
      await documentReference.update(Post.toJson(post));
    } catch (e) {
      print("update post in post service");
      print(e);
      throw e;
    }
  }
}