import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_demo/model/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductRepository {
  final _finalCloud = FirebaseFirestore.instance.collection('products');

  Future<void> create({required String name, required String price}) async {
    try {
      _finalCloud.add({
        "name": name,
        "price": price,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} : ${e.message}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> listProduct = [];
    try {
      final getData = await _finalCloud.get();
      getData.docs.forEach((element) {
        var model = ProductModel.fromJson(element.data());
        return listProduct.add(model);
      });
      return listProduct;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} : ${e.message}");
      }
      return listProduct;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
