import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:untitled13/provider/favorites.dart';

import 'favorite_moc.mocks.dart';

@GenerateMocks([FavoritesProvider])
void main() {
  late FavoritesProvider provider;
  late MockFavoritesProvider mockProvider;

  group(
    'Favorite with mockito',
    () {
      setUp(
        () {
          provider = FavoritesProvider();
          mockProvider = MockFavoritesProvider();
        },
      );

      test('Add new item to favorites', () {
        int index = 30;
        provider.add(index);

        expect(provider.items, contains(index));
      });

      test('Remove item from favorites', () {
        int index = 25;
        provider.add(index);
        provider.remove(index);
        expect(provider.items, isNot(contains(index)));
      });

      test('Remove non-existing item from favorites', () {
        int index = 1;
        provider.remove(index);
        expect(provider.items.length, 0);
      });

      test('Not contains duplicated items', () {
        int index = 9;
        provider.add(index);
        provider.add(index);
        expect(provider.items.length, 1);
      });
    },
  );
}
