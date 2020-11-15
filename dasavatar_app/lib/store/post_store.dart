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
  bool isUploading = false;

  @observable
  ObservableMap<String, Post> posts;

  @action
  getAllPost() async {
    if (posts == null) {
      posts = ObservableMap<String, Post>();
      isLoading = true;
      try {
        await postService.getAllPost(addPostInStore);
      } catch (e) {
        isLoading = false;
        print("in get All Post in post store");
        print(e);
        throw e;
      }
    }
  }

  @action
  addPostInStore(Post post) {
    if (posts == null) {
      posts = ObservableMap<String, Post>();
    }
    if (post != null) posts.addAll({post.id: post});
    isLoading = false;
  }

  @action
  uploadingImage({File imageFile, String id}) async {
    try {
      if (imageFile != null) {
        isUploading = true;
        String url = await uploadFileFirebase.uploadFile(
            file: imageFile, folderName: 'posts', fileName: id);
        Map<String, dynamic> response =
            await verifyService.verifyCrowd(url: url);
        isUploading = false;
        if (response['data']['status']) return url;
      }
      isUploading = false;
      return null;
    } catch (e) {
      isUploading = false;
      print(e);
      throw e;
    }
  }

  @action
  uploadPost({Post post}) async {
    isLoading = true;
    try {
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
      addPostInStore(post);
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
