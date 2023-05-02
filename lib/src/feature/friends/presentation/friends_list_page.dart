import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/src/feature/friends/presentation/friends_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsListPage extends ConsumerStatefulWidget {
  const FriendsListPage({super.key});

  @override
  ConsumerState<FriendsListPage> createState() => _FriendsListPageState();
}

class _FriendsListPageState extends ConsumerState<FriendsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People You May Know'),
      ),
      body: ref.watch(friendsControllerProvider).when(
            data: (data) => ListView.separated(
              itemBuilder: (context, index) {
                final item = data[index];
                return FriendListWidget(
                  name: item.name,
                  bgColor: item.state == 0
                      ? Colors.blue[200]!
                      : item.state == 1
                          ? Colors.blue[50]!
                          : item.state == 2
                              ? Colors.green
                              : Colors.red,
                  action: item.isLoading
                      ? const CircularProgressIndicator()
                      : item.state == 0
                          ? const Text('Add')
                          : item.state == 1
                              ? const Text('Pending')
                              : item.state == 2
                                  ? const Text('Friend')
                                  : const Text('Removed'),
                  onPressed: item.isLoading
                      ? null
                      : () {
                          if (item.state != 2) {
                            ref
                                .read(friendsControllerProvider.notifier)
                                .addFriend(index: index);
                          } else {
                            ref
                                .read(friendsControllerProvider.notifier)
                                .removeFriend(index: index);
                          }
                        },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemCount: data.length,
            ),
            error: (e, st) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

class FriendListWidget extends StatelessWidget {
  const FriendListWidget({
    super.key,
    required this.name,
    required this.bgColor,
    required this.action,
    required this.onPressed,
  });

  final String name;

  final Color bgColor;

  final Widget action;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://codewithandrea.com/img/avatars/andrea-avatar.png',
      ),
      title: Text(name),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: bgColor),
        onPressed: onPressed,
        child: action,
      ),
    );
  }
}
