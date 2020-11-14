import 'dart:io';

import 'package:dasavatar_app/model/user.dart';
import 'package:dasavatar_app/utils/global.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  User loggedInUser;

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
      await setLoggedIn(user);
    } catch (e) {
      print("get user in user store");
      print(e);
      throw e;
    }
  }

  @action
  updatedUser({User user, File imageFile}) async {
    isLoading = true;
    if (imageFile != null) {
      String url = await uploadFileFirebase.uploadFile(
          folderName: 'user_profile', fileName: user.uid, file: imageFile);
      user.imgUrl = url;
    }
    await userService.updateUser(user: user);
    loggedInUser = user;
    isLoading = false;
  }

  @action
  createUser(User user) async {
    isLoading = true;
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
    isLoading = true;
    authService.logout();
    isLoggedIn = false;
    loggedInUser = null;
    await preferenceService.removeUID();
    isLoading = false;
  }
}
