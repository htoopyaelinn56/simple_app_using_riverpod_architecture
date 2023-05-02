import 'dart:async';

import 'package:flutter_app_architecture/src/feature/friends/domain/friends_model.dart';
import 'package:flutter_app_architecture/src/feature/friends/service/friends_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/abstract_friends_repository.dart';

class FriendsController extends AsyncNotifier<List<FriendsModel>> {
  @override
  FutureOr<List<FriendsModel>> build() {
    ref.onDispose(() {
      ref.invalidate(friendsListProvider);
    });
    return ref.read(friendsServiceProvider).getFriends();
  }

  Future<void> addFriend({required int index}) async {
    state.value![index] = state.value![index].copyWith(isLoading: true);
    state = AsyncData(state.value!);
    await ref.read(friendsServiceProvider).addFriend('id');
    state.value![index] = state.value![index].copyWith(state: 1, isLoading: false);
    state = AsyncData(state.value!);
    await Future.delayed(const Duration(seconds: 3)); //fake delay to become friend
    state.value![index] = state.value![index].copyWith(state: 2);
    state = AsyncData(state.value!);
  }

  void removeFriend({required int index}) async {
    if (state.value![index].state == 2) {
      state.value![index] = state.value![index].copyWith(state: 3);
      state = AsyncData(state.value!);
      await ref.read(friendsServiceProvider).removeFriend('id');
      state.value![index] = state.value![index].copyWith(state: 0);
      state = AsyncData(state.value!);
    }
  }
}

final friendsControllerProvider = AsyncNotifierProvider<FriendsController, List<FriendsModel>>(FriendsController.new);
