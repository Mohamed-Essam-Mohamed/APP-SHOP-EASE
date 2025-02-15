import 'package:equatable/equatable.dart';

class ProductResponse extends Equatable {
  Data? data;

  ProductResponse({this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  @override
  List<Object?> get props => [data];
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  String? title;

  Products({this.title});

  Products.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}
