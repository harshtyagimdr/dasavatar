// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$isLoadingAtom = Atom(name: '_PostStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$postsAtom = Atom(name: '_PostStore.posts');

  @override
  ObservableMap<String, Post> get posts {
    _$postsAtom.context.enforceReadPolicy(_$postsAtom);
    _$postsAtom.reportObserved();
    return super.posts;
  }

  @override
  set posts(ObservableMap<String, Post> value) {
    _$postsAtom.context.conditionallyRunInAction(() {
      super.posts = value;
      _$postsAtom.reportChanged();
    }, _$postsAtom, name: '${_$postsAtom.name}_set');
  }

  final _$getAllPostAsyncAction = AsyncAction('getAllPost');

  @override
  Future getAllPost() {
    return _$getAllPostAsyncAction.run(() => super.getAllPost());
  }

  final _$uploadPostAsyncAction = AsyncAction('uploadPost');

  @override
  Future uploadPost({Post post, File imageFile}) {
    return _$uploadPostAsyncAction
        .run(() => super.uploadPost(post: post, imageFile: imageFile));
  }

  final _$clearStoreAsyncAction = AsyncAction('clearStore');

  @override
  Future clearStore() {
    return _$clearStoreAsyncAction.run(() => super.clearStore());
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  dynamic addPostInStore(Post post) {
    final _$actionInfo = _$_PostStoreActionController.startAction();
    try {
      return super.addPostInStore(post);
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }
}
