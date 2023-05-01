import 'package:flutter_app_architecture/src/feature/posts/data/abstract_post_repository.dart';
import 'package:flutter_app_architecture/src/feature/posts/domain/post_model.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepositoryImpl implements PostRepository {
  final Ref ref;
  PostRepositoryImpl(this.ref);
  @override
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      for (int i = 0; i < 20; i++)
        PostModel(id: i, name: 'name $i', favourite: false),
    ];
  }

  @override
  Future<void> toggleFavourite({required int id}) async {
    // api call for favourite or unfavourite
    ref.invalidate(getPostListProvider); //refresh post list after 200
  }

  @override
  Future<List<PostModel>> getFavList() async {
    await Future.delayed(const Duration(seconds: 1));
    final favlist = ref.watch(postItemListControllerProvider.notifier).favList;
    return favlist;
  }
}
