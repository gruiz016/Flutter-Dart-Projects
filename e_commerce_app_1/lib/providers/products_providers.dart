import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';
import '../models/http_exception.dart';

class Products with ChangeNotifier {
  final String authToken;
  List<Product> _items = [];

  Products(this.authToken, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get showFavorites {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product getProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProduct() async {
    final url =
        'https://e-commerce-app-1.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(url);

      final extractedProductData =
          json.decode(response.body) as Map<String, dynamic>;

      if (extractedProductData == null) {
        return;
      }
      final List<Product> loadedProducts = [];

      extractedProductData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          imageUrl: prodData['imageUrl'],
          price: prodData['price'],
          isFavorite: prodData['isFavorite'],
        ));
      });

      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://e-commerce-app-1.firebaseio.com/products.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavorite': product.isFavorite,
        }),
      );
      final newProduct = Product(
        title: product.title,
        price: product.price,
        description: product.description,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product editedProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://e-commerce-app-1.firebaseio.com/products/$id.json';
      await http.patch(url,
          body: json.encode({
            'title': editedProduct.title,
            'description': editedProduct.description,
            'imageUrl': editedProduct.imageUrl,
            'price': editedProduct.price,
          }));
      _items[prodIndex] = editedProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://e-commerce-app-1.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Oops, could not delete message!');
    }
    existingProduct = null;
  }
}
