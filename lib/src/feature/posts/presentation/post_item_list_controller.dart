import 'dart:async';

import 'package:flutter_app_architecture/src/feature/posts/service/post_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/post_model.dart';

class PostItemListController extends AsyncNotifier<List<PostModel>> {
  @override
  FutureOr<List<PostModel>> build() async {
    return ref.read(postServiceProvider).getPosts();
  }

  void toggleFavourite({required PostModel post}) async {
    await ref.read(postServiceProvider).toggleFavourite(id: post.id);
    final index = state.value!.indexOf(post);
    state.value![index] = state.value![index].copyWith(favourite: !state.value![index].favourite);
    state = AsyncData(state.value!);
  }
}

final postItemListControllerProvider = AsyncNotifierProvider<PostItemListController, List<PostModel>>(() {
  return PostItemListController();
});
