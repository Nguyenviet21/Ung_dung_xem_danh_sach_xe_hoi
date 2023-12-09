class Car {
  final String name;
  final String imgSrc;
  final Set<String> favorites;

  bool get isFavorite => favorites.contains('user_id');

  Car({
    required this.name,
    required this.imgSrc,
    Set<String>? favorites,
  }) : favorites = favorites ?? {};
}

class CarModel {
  final _items = <Car>{};

  Set<Car> get items => _items;

  CarModel._();

  static final instance = CarModel._();

  factory CarModel() => instance;

  void addItem(Car item) {
    _items.add(item);
  }

  void removeItem(Car item) {
    _items.remove(item);
  }

  void onFavorite(Car item, String userld) {
    if (item.favorites.contains(userld)) {
      item.favorites.remove(userld);
    } else {
      item.favorites.add(userld);
    }
  }
}
