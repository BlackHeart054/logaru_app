import 'package:logaru/interfaces/menu_interface.dart';
import 'package:logaru/interfaces/special_offers_inferface.dart';
import 'package:mobx/mobx.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  final baseImgUrl = "./../assets/images/";
  @observable
  ObservableList<String> categories = ObservableList.of([
    'Entradas',
    'Pratos Principais',
    'Sobremesas',
    'Bebidas',
  ]);

  @observable
  ObservableList<MenuItem> menuItems = ObservableList.of([
    MenuItem(
        name: 'Salada Caesar',
        category: 'Entradas',
        price: 12.0,
        imageUrl: './../assets/images/saladaCaesar.png'),
    MenuItem(
        name: 'Bruschetta',
        category: 'Entradas',
        price: 10.0,
        imageUrl: './../assets/images/bruschetta.png'),
    MenuItem(
        name: 'Filé Mignon',
        category: 'Pratos Principais',
        price: 45.0,
        imageUrl: './../assets/images/fileMignon.png'),
    MenuItem(
        name: 'Lasanha à Bolonhesa',
        category: 'Pratos Principais',
        price: 38.0,
        imageUrl: './../assets/images/lasanhaBolonhesa.png'),
    MenuItem(
        name: 'Tiramisu',
        category: 'Sobremesas',
        price: 18.0,
        imageUrl: './../assets/images/tiramisu.png'),
    MenuItem(
        name: 'Pudim',
        category: 'Sobremesas',
        price: 12.0,
        imageUrl: './../assets/images/pudim.png'),
    MenuItem(
        name: 'Suco de Laranja',
        category: 'Bebidas',
        price: 7.0,
        imageUrl: './../assets/images/sucoLaranja.png'),
    MenuItem(
        name: 'Coca-Cola',
        category: 'Bebidas',
        price: 5.0,
        imageUrl: './../assets/images/cocaCola.png'),
  ]);

  @observable
  ObservableList<MenuItem> cartItems = ObservableList<MenuItem>();

  @observable
  ObservableList<SpecialOffer> specialOffers = ObservableList.of([
    SpecialOffer(
        name: 'Macarrão Primavera',
        imageUrl: './../assets/images/macarraoPrimavera.png',
        discount: 20,
        price: 12.99,
        originalPrice: 16.00),
    SpecialOffer(
        name: 'Bolo de Chocolate',
        imageUrl: './../assets/images/boloChocolate.png',
        discount: 22,
        price: 6.99,
        originalPrice: 9.00),
  ]);

  @action
  void addToCart(MenuItem item) {
    cartItems.add(item);
  }

  @action
  void removeFromCart(MenuItem item) {
    cartItems.remove(item);
  }

  @computed
  Map<String, ObservableList<MenuItem>> get categorizedMenuItems {
    Map<String, ObservableList<MenuItem>> categorizedItems = {};
    for (var category in categories) {
      categorizedItems[category] = ObservableList.of(
          menuItems.where((item) => item.category == category).toList());
    }
    return categorizedItems;
  }
}
