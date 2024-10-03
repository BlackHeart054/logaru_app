// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RestaurantStore on _RestaurantStoreBase, Store {
  Computed<Map<String, ObservableList<MenuItem>>>?
      _$categorizedMenuItemsComputed;

  @override
  Map<String, ObservableList<MenuItem>> get categorizedMenuItems =>
      (_$categorizedMenuItemsComputed ??=
              Computed<Map<String, ObservableList<MenuItem>>>(
                  () => super.categorizedMenuItems,
                  name: '_RestaurantStoreBase.categorizedMenuItems'))
          .value;

  late final _$categoriesAtom =
      Atom(name: '_RestaurantStoreBase.categories', context: context);

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$menuItemsAtom =
      Atom(name: '_RestaurantStoreBase.menuItems', context: context);

  @override
  ObservableList<MenuItem> get menuItems {
    _$menuItemsAtom.reportRead();
    return super.menuItems;
  }

  @override
  set menuItems(ObservableList<MenuItem> value) {
    _$menuItemsAtom.reportWrite(value, super.menuItems, () {
      super.menuItems = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_RestaurantStoreBase.cartItems', context: context);

  @override
  ObservableList<MenuItem> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<MenuItem> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$specialOffersAtom =
      Atom(name: '_RestaurantStoreBase.specialOffers', context: context);

  @override
  ObservableList<SpecialOffer> get specialOffers {
    _$specialOffersAtom.reportRead();
    return super.specialOffers;
  }

  @override
  set specialOffers(ObservableList<SpecialOffer> value) {
    _$specialOffersAtom.reportWrite(value, super.specialOffers, () {
      super.specialOffers = value;
    });
  }

  late final _$_RestaurantStoreBaseActionController =
      ActionController(name: '_RestaurantStoreBase', context: context);

  @override
  void addToCart(MenuItem item) {
    final _$actionInfo = _$_RestaurantStoreBaseActionController.startAction(
        name: '_RestaurantStoreBase.addToCart');
    try {
      return super.addToCart(item);
    } finally {
      _$_RestaurantStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(MenuItem item) {
    final _$actionInfo = _$_RestaurantStoreBaseActionController.startAction(
        name: '_RestaurantStoreBase.removeFromCart');
    try {
      return super.removeFromCart(item);
    } finally {
      _$_RestaurantStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
menuItems: ${menuItems},
cartItems: ${cartItems},
specialOffers: ${specialOffers},
categorizedMenuItems: ${categorizedMenuItems}
    ''';
  }
}
