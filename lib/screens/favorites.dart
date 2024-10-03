import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FavoritesProvider>(
          builder: (context, provider, child) => ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) =>
                    FavoriteTile(provider.items[index]),
              )),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  final int index;

  const FavoriteTile(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    // print(Colors.primaries[index]);
    FavoritesProvider favorites = Provider.of<FavoritesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[index],
          ),
          title: Text('Item $index'),
          trailing: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              favorites.remove(index);
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('Removed from favorites')));
            },
          )),
    );
  }
}
