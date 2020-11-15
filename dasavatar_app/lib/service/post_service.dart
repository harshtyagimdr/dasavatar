import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dasavatar_app/model/post.dart';

class PostService {
  PostService._();

  factory PostService.getInstance() => _instance;
  static final PostService _instance = PostService._();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, Post>> getAllPost() async {
    try {
      Map<String, Post> posts = Map<String, Post>();
      QuerySnapshot querySnapshot = await _firestore.collection('posts').get();
      querySnapshot.docs.forEach((element) {
        posts.addAll({element.id: Post.fromJson(element.data())});
      });
      return posts;
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
