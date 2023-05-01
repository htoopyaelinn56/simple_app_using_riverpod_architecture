import 'package:flutter/material.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    super.key,
    required this.name,
    required this.favourite,
    this.isFavIcon = true,
    required this.toggleFavourite,
  });
  final String name;
  final bool favourite;
  final bool isFavIcon;
  final void Function() toggleFavourite;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(
                'https://static.displate.com/857x1200/displate/2022-06-20/288c8d32951f0bf177ef9487074c6ef7_f0683a24631301bdb79d821a8d6618e6.jpg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isFavIcon)
                    InkWell(
                      onTap: toggleFavourite,
                      child: Icon(
                          favourite ? Icons.favorite : Icons.favorite_border),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
