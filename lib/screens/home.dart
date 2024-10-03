import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/provider/favorites.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing App'),
        actions: [
          TextButton(
            child: const Row(
              children: [
                Icon(Icons.favorite),
                SizedBox(
                  width: 8,
                ),
                Text('Favorites')
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/favorites');
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 100, itemBuilder: (context, index) => ItemTile(index)),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int index;

  const ItemTile(this.index);

  @override
  Widget build(BuildContext context) {
    // print(Colors.primaries[index]);
    FavoritesProvider favorites = Provider.of<FavoritesProvider>(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[index],
          ),
          title: Text('Item $index'),
          trailing: IconButton(
            icon: favorites.items.contains(index)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              print('Pressed $index');
              favorites.items.contains(index)
                  ? favorites.remove(index)
                  : favorites.add(index);
            },
          )),
    );
  }
}
