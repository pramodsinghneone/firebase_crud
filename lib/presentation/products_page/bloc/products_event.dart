part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductCreate extends ProductsEvent {
  final String name;
  final String price;
  const ProductCreate(this.name, this.price);
  @override
  List<Object> get props => [name, price];
}

class ProductUpdate extends ProductsEvent {
  final String name;
  final String price;
  const ProductUpdate(this.name, this.price);
  @override
  List<Object> get props => [name, price];
}

class ProductGetData extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class ProductUpdateEvent extends ProductsEvent {
  final String docId;
  final String name;
  final String price;
  ProductUpdateEvent(
      {required this.docId, required this.name, required this.price});

  List<Object> get props => [docId, name, price];
}

class ProductDeleteEvent extends ProductsEvent {
  final String docId;
  ProductDeleteEvent({required this.docId});
  @override
  List<Object> get props => [docId];
}
