import 'package:flutter_app_architecture/src/feature/friends/domain/friends_model.dart';
import 'package:flutter_app_architecture/src/feature/friends/repository/abstract_friends_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsService {
  final Ref ref;
  FriendsService({required this.ref});

  Future<List<FriendsModel>> getFriends() async {
    return await ref.read(friendsListProvider.future);
  }

  Future<void> addFriend(String id) async {
    await ref.read(friendsRepositoryProvider).addFriend(id);
  }

  Future<void> removeFriend(String id) async {
    await ref.read(friendsRepositoryProvider).removeFriend(id);
  }
}

final friendsServiceProvider = Provider<FriendsService>((ref) {
  return FriendsService(ref: ref);
});
