import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crud_demo/model/product_model.dart';
import 'package:firebase_crud_demo/repository/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;

  ProductsBloc({required this.productRepository}) : super(ProductsInitial()) {
    on<ProductCreate>((event, emit) async {
      emit(ProductsAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await productRepository.create(name: event.name, price: event.price);
        emit(ProductsAdded());
      } catch (e) {
        print(e.toString());
        emit(ProductsError(e.toString()));
      }
    });

    on<ProductGetData>((event, emit) async {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 1));
      try {
        final data = await productRepository.getProducts();
        emit(ProductLoaded(productList: data));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });

    on<ProductUpdateEvent>((event, emit) async {
      try {
        await productRepository.update(
            name: event.name, price: event.price, path: event.docId);
        emit(ProductUpdated());
      } catch (e) {
        emit(ProductUpdateFailed(errorMsg: e.toString()));
      }
    });

    on<ProductDeleteEvent>(
      (event, emit) async {
        try {
          await productRepository.delete(path: event.docId);
          emit(ProductDeletedSuccess());
        } catch (e) {
          emit(ProductDeletedFailed());
        }
      },
    );
  }
}
