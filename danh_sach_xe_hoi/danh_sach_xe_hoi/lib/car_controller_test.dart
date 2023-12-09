import 'package:flutter_test/flutter_test.dart';
import '../car_controller.dart';
import '../car_model.dart';

void main() {
  group('CarController', () {
    test(
        'should create a new instance of CarController using factory constructor',
        () {
      final controller1 = CarController();
      final controller2 = CarController();

      expect(controller1, isInstanceOf<CarController>());
      expect(controller2, isInstanceOf<CarController>());
      expect(controller1, equals(controller2));
    });

    test('should initialize the list of items with the correct values', () {
      final model = CarModel();

      expect(model.items.length, equals(5));
      expect(model.items.first.name, equals('Coupe Maserati'));
      expect(model.items.last.name, equals('190 SL Roadster 1962'));
    });

    test('should add a new item to the list when calling addItem', () {
      final controller = CarController();
      final model = CarModel();
      final item =
          Car(name: 'Tesla Model S', imgSrc: 'assets/images/tesla-model-s.jpg');

      controller.addItem(item);

      expect(model.items.length, equals(6));
      expect(model.items.last, equals(item));
    });

    test('should remove an item from the list when calling removeItem', () {
      final controller = CarController();
      final model = CarModel();
      final itemToRemove = model.items.first;

      controller.removeItem(itemToRemove);

      expect(model.items.length, equals(5));
      expect(model.items.contains(itemToRemove), isFalse);
    });

    test('should mark an item as a favorite when calling onFavorite', () {
      final controller = CarController();
      final model = CarModel();
      final item = model.items.first;

      controller.onFavorite(item);

      expect(item.isFavorite, isTrue);
    });
  });
}
