import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_card.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_item_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavListPage extends StatelessWidget {
  const FavListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, _) {
                final favList =
                    ref.watch(postItemListControllerProvider.notifier).favList;
                return ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (_, index) {
                    final item = favList[index];
                    return PostItemCard(
                      isFavIcon: false,
                      name: item.name,
                      favourite: item.favourite,
                      toggleFavourite: () {},
                    );
                  },
                  itemCount: favList.length,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
