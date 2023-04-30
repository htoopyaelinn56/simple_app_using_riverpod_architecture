import 'package:flutter_app_architecture/src/feature/posts/data/post_repository_impl.dart';
import 'package:flutter_app_architecture/src/feature/posts/domain/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
  Future<void> toggleFavourite({required int id});
}

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepositoryImpl(ref);
});

final getPostListProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.watch(postRepositoryProvider).getPosts();
});
