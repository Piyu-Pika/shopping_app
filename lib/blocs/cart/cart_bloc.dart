import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/product_model.dart';
import '../../models/cart_item_model.dart';

// Events
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;

  AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart(this.productId);

  @override
  List<Object> get props => [productId];
}

class UpdateQuantity extends CartEvent {
  final int productId;
  final int quantity;

  UpdateQuantity(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}

class ClearCart extends CartEvent {}

// States
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);

  double get totalAmount {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  List<Object> get props => [items];
}

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is CartInitial) {
      emit(CartLoaded([CartItem(product: event.product, quantity: 1)]));
    } else if (currentState is CartLoaded) {
      final existingItemIndex = currentState.items.indexWhere(
        (item) => item.product.id == event.product.id,
      );

      if (existingItemIndex >= 0) {
        // Product already in cart, increase quantity
        final updatedItems = List<CartItem>.from(currentState.items);
        final existingItem = updatedItems[existingItemIndex];
        updatedItems[existingItemIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
        emit(CartLoaded(updatedItems));
      } else {
        // Add new product to cart
        emit(CartLoaded(
          List.from(currentState.items)
            ..add(CartItem(product: event.product, quantity: 1)),
        ));
      }
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final updatedItems = currentState.items
          .where((item) => item.product.id != event.productId)
          .toList();
      emit(CartLoaded(updatedItems));
    }
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final updatedItems = List<CartItem>.from(currentState.items);
      final itemIndex = updatedItems.indexWhere(
        (item) => item.product.id == event.productId,
      );

      if (itemIndex >= 0) {
        if (event.quantity <= 0) {
          // Remove item if quantity is 0 or less
          updatedItems.removeAt(itemIndex);
        } else {
          // Update quantity
          updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
            quantity: event.quantity,
          );
        }
        emit(CartLoaded(updatedItems));
      }
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  }
}
