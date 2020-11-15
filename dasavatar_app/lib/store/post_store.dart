import 'dart:io';

import 'package:dasavatar_app/model/post.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, Post> posts;

  @action
  gerAllPost() async {
    if (posts == null) {
      posts = ObservableMap<String, Post>();
      isLoading = true;
      try {
        Map<String, Post> reponse = await postService.getAllPost();
        posts.addAll(reponse);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("in get All Post in post store");
        print(e);
        throw e;
      }
    }
  }

  @action
  uploadPost({Post post, File imageFile}) async {
    if (posts == null) {
      posts = ObservableMap<String, Post>();
    }
    isLoading = true;
    try {
      if (imageFile != null) {
        String url = await uploadFileFirebase.uploadFile(
            folderName: 'user_profile', fileName: post.id, file: imageFile);
        post.imageUrl = url;
      }
      if (post.latitude == null) {
        bool per = await locationPermission();
        if (per) {
          isLoading = true;
          Position position = await locationService.getLatLong();
          print("response in fetch address ");
          if (position != null) {
            post.latitude = position.latitude.toString();
            post.longitude = position.longitude.toString();
          }
        }
      }
      await postService.uploadPost(post: post);
      posts.addAll({post.id: post});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("upload Post in post store");
      print(e);
      throw e;
    }
  }

  @action
  clearStore() async {
    isLoading = false;
  }
}
