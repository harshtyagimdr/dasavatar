import 'dart:io';

import 'package:dasavatar_app/model/user.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isUploading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  User loggedInUser;

  @observable
  ObservableMap<String, User> userList = ObservableMap<String, User>();

  @action
  login({String email, String password}) async {
    isLoading = true;
    try {
      String uid = await authService.login(email: email, passowrd: password);
      if (uid != null)
        await getUser(uid: uid);
      else
        isLoading = false;
    } catch (e) {
      isLoading = false;
      throw e;
    }
  }

  @action
  signUp({User user, String password}) async {
    isLoading = true;
    try {
      String uid =
          await authService.signUp(email: user.email, passowrd: password);
      if (uid != null) {
        user.uid = uid;
        await createUser(user);
      } else
        isLoading = false;
    } catch (e) {
      isLoading = false;
      throw e;
    }
  }

  @action
  getUser({String uid}) async {
    try {
      isLoading = true;
      User user = await userService.getUser(id: uid);
      if (user.latitude == null) {
        bool per = await locationPermission();
        if (per) {
          isLoading = true;
          Position position = await locationService.getLatLong();
          print("response in fetch address ");
          if (position != null) {
            user.latitude = position.latitude.toString();
            user.longitude = position.longitude.toString();
          }
          await updatedUser(user: user);
        } else {
          await setLoggedIn(user);
        }
      } else {
        await setLoggedIn(user);
      }
    } catch (e) {
      print("get user in user store");
      print(e);
      throw e;
    }
  }

  @action
  getUserById({String uid}) async {
    if (userList.containsKey(uid)) return;
    try {
      User user = await userService.getUser(id: uid);
      if (user != null) userList.addAll({uid: user});
    } catch (e) {
      print("get user by list in user store");
      print(e);
      throw e;
    }
  }

  @action
  uploadingImage({File imageFile, String id}) async {
    try {
      if (imageFile != null) {
        isUploading = true;
        String url = await uploadFileFirebase.uploadFile(
            file: imageFile, folderName: 'user_profile', fileName: id);
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
  updatedUser({User user}) async {
    isLoading = true;
    if (user.latitude == null) {
      bool per = await locationPermission();
      if (per) {
        isLoading = true;
        Position position = await locationService.getLatLong();
        print("response in fetch address ");
        if (position != null) {
          user.latitude = position.latitude.toString();
          user.longitude = position.longitude.toString();
        }
      }
    }
    await userService.updateUser(user: user);
    setLoggedIn(user);
  }

  @action
  createUser(User user) async {
    isLoading = true;
    if (user.latitude == null) {
      bool per = await locationPermission();
      if (per) {
        isLoading = true;
        Position position = await locationService.getLatLong();
        print("response in fetch address ");
        if (position != null) {
          user.latitude = position.latitude.toString();
          user.longitude = position.longitude.toString();
        }
      }
    }
    user = await userService.setUser(user: user);
    await setLoggedIn(user);
  }

  @action
  setLoggedIn(User user) async {
    print("set login user");
    await preferenceService.setUID(user.uid);
    loggedInUser = user;
    isLoggedIn = true;
    isLoading = false;
  }

  @action
  logout() async {
    await preferenceService.removeUID();
    authService.logout();
    isLoggedIn = false;
    loggedInUser = User();
    isLoading = false;
  }
}
