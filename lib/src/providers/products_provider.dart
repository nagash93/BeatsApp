import 'package:beats_app/src/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = new List();

  ProductsProvider() {
    _loadProducts();
  }

  void notify() {
    notifyListeners();
  }

  List<Product> get products => _products;

  _loadProducts() {
    Product prod1 = new Product(
        nombre: 'Beats Studio3 Wireless',
        titulo: 'Warriors',
        subtitulo: 'Royal Blue',
        precio: 349.95,
        bateria: 45,
        color: 0xff08399B,
        favorito: true,
        url: 'blue.png');

    Product prod2 = new Product(
        nombre: 'Studio3 Wireless',
        titulo: 'Warriors',
        subtitulo: 'Royal Red',
        precio: 300.95,
        bateria: 30,
        color: 0xff922325,
        favorito: false,
        url: 'black-red.png');

    Product prod3 = new Product(
        nombre: 'Beats Wireless',
        titulo: 'Fighter',
        subtitulo: 'Space Grey',
        precio: 449.95,
        bateria: 50,
        color: 0xff252525,
        favorito: false,
        url: 'black.png');

    Product prod4 = new Product(
        nombre: 'Beats Studio3 Wireless',
        titulo: 'Finest',
        subtitulo: 'Royal Gold',
        precio: 239.95,
        bateria: 25,
        color: 0xffC7B29B,
        favorito: true,
        url: 'gold.png');

    Product prod5 = new Product(
        nombre: 'Beats Studio3',
        titulo: 'Warriors',
        subtitulo: 'Royal Red',
        precio: 349.95,
        bateria: 45,
        color: 0xffD84C3B,
        favorito: false,
        url: 'red.png');

    Product prod6 = new Product(
        nombre: 'Beats Studio3',
        titulo: 'Warriors',
        subtitulo: 'Royal Teal',
        precio: 349.95,
        bateria: 45,
        color: 0xff23526D,
        favorito: false,
        url: 'teal.png');

    this._products.addAll([
      prod1,
      prod2,
      prod3,
      prod4,
      prod5,
      prod6,
    ]);
  }
}
