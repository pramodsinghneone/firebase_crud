part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsAdding extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsAdded extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsError extends ProductsState {
  final String error;
  const ProductsError(this.error);
  @override
  List<Object> get props => [error];
}

class ProductLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductsState {
  List<ProductModel> productList = [];
  ProductLoaded({required this.productList});
  @override
  List<Object> get props => [productList];
}

class ProductUpdated extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductUpdateFailed extends ProductsState {
  final String errorMsg;
  ProductUpdateFailed({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class ProductDeletedSuccess extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductDeletedFailed extends ProductsState {
  @override
  List<Object> get props => [];
}
