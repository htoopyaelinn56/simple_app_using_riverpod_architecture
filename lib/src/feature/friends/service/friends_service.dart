import 'package:flutter_app_architecture/src/feature/friends/domain/friends_model.dart';
import 'package:flutter_app_architecture/src/feature/friends/repository/abstract_friends_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsService {
  final Ref ref;
  FriendsService({required this.ref});

  Future<List<FriendsModel>> getFriends() async {
    return await ref.watch(friendsListProvider.future)!;
  }
}

final friendsServiceProvider = Provider<FriendsService>((ref) {
  return FriendsService(ref: ref);
});
