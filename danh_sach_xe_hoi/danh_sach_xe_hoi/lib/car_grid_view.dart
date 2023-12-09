import 'package:flutter/material.dart';
import 'car_controller.dart';
import 'car_model.dart';

class CarGridView extends StatelessWidget {
  final CarController carController = CarController();
  final CarModel carModel = CarModel();

  CarGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car List App')),
      body: AnimatedBuilder(
        animation: carController,
        builder: (context, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: carModel.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = carModel.items.elementAt(index);
              return CarItem(
                item: item,
                onFavorite: () => carController.onFavorite(item),
              );
            },
          );
        },
      ),
    );
  }
}

class CarItem extends StatelessWidget {
  final Car item;
  final VoidCallback onFavorite;

  const CarItem({Key? key, required this.item, required this.onFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              item.name,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
            trailing: TextButton.icon(
              icon: item.isFavorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: onFavorite,
              label: Text('${item.favorites.length}'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
        ),
        child: Image.asset(
          item.imgSrc,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.photo),
            );
          },
        ),
      ),
    );
  }
}
