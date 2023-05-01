import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/src/feature/auth/presentation/profile_page.dart';
import 'package:flutter_app_architecture/src/feature/friends/presentation/friends_list_page.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/fav_list_page.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_card.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_list_controller.dart';
import 'package:flutter_app_architecture/src/util/page_pusher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        actions: [
          IconButton(
            onPressed: () {
              pagePush(context: context, page: const FavListPage());
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              pagePush(context: context, page: const FriendsListPage());
            },
            icon: const Icon(Icons.group_add),
          ),
          IconButton(
            onPressed: () {
              pagePush(context: context, page: const ProfilePage());
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, _) {
                return ref.watch(postItemListControllerProvider).when(
                      data: (data) {
                        return ListView.separated(
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (_, index) {
                            final item = data[index];
                            return PostItemCard(
                              name: item.name,
                              favourite: item.favourite,
                              toggleFavourite: () {
                                ref
                                    .read(
                                        postItemListControllerProvider.notifier)
                                    .toggleFavourite(post: item);
                              },
                            );
                          },
                          itemCount: 20,
                        );
                      },
                      error: (e, st) => Center(
                        child: Text('$e'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
