import 'package:flutter_app_architecture/src/feature/posts/domain/post_model.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FavRepository {
  Future<List<PostModel>> getFavList();
}

class FavRepositoryImpl implements FavRepository {
  final Ref ref;
  FavRepositoryImpl({required this.ref});

  @override
  Future<List<PostModel>> getFavList() async {
    await Future.delayed(const Duration(seconds: 1));
    final favlist = ref.watch(postItemListControllerProvider.notifier).favList;
    return favlist;
  }
}

final favRepositoryProvider = Provider<FavRepository>((ref) {
  return FavRepositoryImpl(ref: ref);
});

final favListProvider =
    FutureProvider.autoDispose<List<PostModel>>((ref) async {
  return ref.watch(favRepositoryProvider).getFavList();
});
