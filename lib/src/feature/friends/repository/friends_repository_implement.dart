import 'package:flutter_app_architecture/src/feature/friends/domain/friends_model.dart';
import 'package:flutter_app_architecture/src/feature/friends/repository/abstract_friends_repository.dart';

class FriendsRepositoryImplement implements FriendsRepository {
  @override
  Future<List<FriendsModel>> getFriendsList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      for (int i = 0; i < 20; i++)
        FriendsModel(
          id: i.toString(),
          name: 'Sayar Gyi Andrea $i',
          state: 0,
          isLoading: false,
        ),
    ];
  }

  @override
  Future<void> addFriend(String id) async {
    const status = 200;
    if (status == 200) {
      await Future.delayed(const Duration(seconds: 1));
    } else {
      throw 'Internal Server Error';
    }
  }

  @override
  Future<void> removeFriend(String id) async {
    const status = 200;
    if (status == 200) {
      await Future.delayed(const Duration(seconds: 1));
    } else {
      throw 'Internal Server Error';
    }
  }
}
