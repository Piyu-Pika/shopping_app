import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/product_model.dart';
import '../../services/product_service.dart';

// Events
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {}

class FetchMoreProducts extends ProductEvent {}

// States
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;
  final int currentPage;

  ProductLoaded({
    required this.products,
    required this.hasReachedMax,
    required this.currentPage,
  });

  ProductLoaded copyWith({
    List<Product>? products,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [products, hasReachedMax, currentPage];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService;
  final int _limit = 10;

  ProductBloc({required ProductService productService})
      : _productService = productService,
        super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchMoreProducts>(_onFetchMoreProducts);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final productsResponse =
          await _productService.getProducts(limit: _limit, skip: 0);
      emit(
        ProductLoaded(
          products: productsResponse.products,
          hasReachedMax: productsResponse.products.length < _limit,
          currentPage: 0,
        ),
      );
    } catch (e) {
      emit(ProductError('Failed to fetch products: ${e.toString()}'));
    }
  }

  Future<void> _onFetchMoreProducts(
    FetchMoreProducts event,
    Emitter<ProductState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      if (currentState.hasReachedMax) return;

      try {
        final nextPage = currentState.currentPage + 1;
        final productsResponse = await _productService.getProducts(
          limit: _limit,
          skip: nextPage * _limit,
        );

        final hasReachedMax = productsResponse.products.length < _limit;

        emit(
          currentState.copyWith(
            products: List.of(currentState.products)
              ..addAll(productsResponse.products),
            hasReachedMax: hasReachedMax,
            currentPage: nextPage,
          ),
        );
      } catch (e) {
        emit(ProductError('Failed to fetch more products: ${e.toString()}'));
      }
    }
  }
}
