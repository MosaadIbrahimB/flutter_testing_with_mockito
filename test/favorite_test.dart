import 'package:flutter_test/flutter_test.dart';
import 'package:untitled13/provider/favorites.dart';

void main() {
  group(
    'Test Provider',
    () {
      var provider = FavoritesProvider();
      test('Add new item to favorites', () {
        int index = 30;
        provider.add(index);

        expect(provider.items.contains(index), true);
      });

      test(
        'Remove Item from favorites',
        () {
          int index = 25;
          provider.add(index);
          expect(provider.items.contains(index), true);
          provider.remove(index);
          expect(provider.items.contains(index), false);
        },
      );

      test(
        'Not contains duplicated items',
        () {
          int index = 9;
          provider.add(index);
          provider.add(index);
          expect(provider.items.length, 1);
        },
      );
    },
  );
}
