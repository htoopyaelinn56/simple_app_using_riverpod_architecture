import 'package:flutter_app_architecture/src/feature/posts/data/abstract_post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/post_model.dart';

class PostService {
  final Ref ref;
  PostService(this.ref);

  Future<List<PostModel>> getPosts() async {
    return await ref.read(getPostListProvider.future);
  }

  Future<void> toggleFavourite({required int id}) async {
    await ref.read(postRepositoryProvider).toggleFavourite(id: id);
  }
}

final postServiceProvider = Provider<PostService>((ref) {
  return PostService(ref);
});
