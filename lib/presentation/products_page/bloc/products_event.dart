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

class ProductGetData extends ProductsEvent {
  ProductGetData();
}
