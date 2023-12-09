import 'package:flutter_test/flutter_test.dart';
import '../car_model.dart';

void main() {
  group('CarModel tests', () {
    test('addItem() adds a Car item to the model', () {
      final model = CarModel();
      model.items.clear();
      final item = Car(name: 'test', imgSrc: 'test.png');
      model.addItem(item);

      expect(model.items.length, 1);
      expect(model.items.first, item);
    });

    test('removeItem() removes a Car item from the model', () {
      final model = CarModel();
      model.items.clear();
      final item = Car(name: 'test', imgSrc: 'test.png');
      model.addItem(item);

      expect(model.items.length, 1);

      model.removeItem(item);

      expect(model.items.length, 0);
    });

    test('onFavorite() adds a favorite to a Car item', () {
      final model = CarModel();
      model.items.clear();
      final item = Car(name: 'test', imgSrc: 'test.png');
      model.addItem(item);

      expect(model.items.first.favorites.length, 0);

      model.onFavorite(item, 'user_id');

      expect(model.items.first.favorites.length, 1);
      expect(model.items.first.favorites.first, 'user_id');
    });

    test('onFavorite() removes a favorite from a Car item', () {
      final model = CarModel();
      model.items.clear();
      final item = Car(name: 'test', imgSrc: 'test.png');
      model.addItem(item);
      model.onFavorite(item, 'user_id');

      expect(model.items.first.favorites.length, 1);

      model.onFavorite(item, 'user_id');

      expect(model.items.first.favorites.length, 0);
    });
  });
}
