import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'car_model.dart';

class CarController extends ChangeNotifier {
  final CarModel _model;
  static final CarController _instance = CarController._(CarModel());

  factory CarController() {
    return _instance;
  }

  CarController._(this._model) {
    _model.items.addAll(_items);
  }

  final Set<Car> _items = {
    Car(
      name: 'Coupe Maserati',
      imgSrc: 'assets/images/black-convertible-coupe.webp',
    ),
    Car(
      name: 'Camaro SS 1LE',
      imgSrc: 'assets/images/chevrolet-camaro.webp',
    ),
    Car(
      name: 'Dodger Charger 1970',
      imgSrc: 'assets/images/dodge-charger.jpg',
    ),
    Car(
      name: 'Ford Mustang 1966',
      imgSrc: 'assets/images/ford-mustang.webp',
    ),
    Car(
      name: '190 SL Roadster 1962',
      imgSrc: 'assets/images/mercedes-benz.jpg',
    ),
  };

  void addItem(Car item) {
    _model.addItem(item);
    notifyListeners();
  }

  void removeItem(Car item) {
    _model.removeItem(item);
    notifyListeners();
  }

  void onFavorite(Car item) {
    _model.onFavorite(item, 'user_id');
    notifyListeners();
  }
}
