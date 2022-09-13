import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_demo/model/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductRepository {
  final _finalCloud = FirebaseFirestore.instance.collection('products');
  final _finalCloudUpdate = FirebaseFirestore.instance.collection('products');

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

  Future<void> update(
      {required String name,
      required String price,
      required String path}) async {
    try {
      Map<String, Object> data = {
        'name': name,
        'price': price,
      };
      final resUpdated = await _finalCloudUpdate.doc(path).update(data);
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
        print("docsId ${element.id}");
        var model = ProductModel.fromJson(element.data());
        model.docId = element.id;
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
