import 'package:flutter_app_architecture/src/feature/posts/data/abstract_post_repository.dart';
import 'package:flutter_app_architecture/src/feature/posts/domain/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      for (int i = 0; i < 20; i++) PostModel(id: i, name: 'name $i', favourite: false),
    ];
  }

  @override
  Future<void> toggleFavourite({required int id}) async {
    // api call for favourite or unfavourite
  }
}
