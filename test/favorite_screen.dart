import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/provider/favorites.dart';
import 'package:untitled13/screens/favorites.dart';

import 'favorite_moc.mocks.dart';

@GenerateMocks([FavoritesProvider])
void main() {
  late MockFavoritesProvider mockProvider;
  group(
    'Test favorite screen',
        () {
      setUp(
            () {
          mockProvider = MockFavoritesProvider();
        },
      );

      testWidgets(
        'list view display item',
            (widgetTester) async {
          when(mockProvider.items).thenReturn([1, 2, 3, 4]);
          await widgetTester
              .pumpWidget(ChangeNotifierProvider<FavoritesProvider>.value(
            value: mockProvider,
            child: const MaterialApp(
              home: FavoritesPage(),
            ),
          ));
          expect(find.text('Item 1'), findsOneWidget);
          expect(find.text('Item 2'), findsOneWidget);
          expect(find.text('Item 3'), findsOneWidget);
          expect(find.text('Item 4'), findsOneWidget);
        },
      );




      testWidgets(
        'Favorite icon pressed',
            (widgetTester) async {
          when(mockProvider.items).thenReturn([5]);
          await widgetTester.pumpWidget(
            ChangeNotifierProvider<FavoritesProvider>.value(
              value: mockProvider,
              child: const MaterialApp(
                home: FavoritesPage(),
              ),
            ),
          );

          await widgetTester.tap(find.byIcon(Icons.favorite));
          verify(mockProvider.remove(5)).called(1);
        },
      );
    },
  );
}
