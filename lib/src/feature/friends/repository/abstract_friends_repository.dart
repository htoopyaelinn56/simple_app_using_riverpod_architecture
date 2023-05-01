import 'package:flutter_app_architecture/src/feature/friends/domain/friends_model.dart';
import 'package:flutter_app_architecture/src/feature/friends/repository/friends_repository_implement.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FriendsRepository {
  Future<List<FriendsModel>> getFriendsList();
}

final friendsRepositoryProvider = Provider<FriendsRepository>((ref) {
  return FriendsRepositoryImplement();
});

final friendsListProvider = FutureProvider<List<FriendsModel>>((ref) async {
  return ref.watch(friendsRepositoryProvider).getFriendsList();
});
