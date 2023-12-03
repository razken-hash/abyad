import 'package:abyad/models/libas_item.dart';
import 'package:abyad/repositories/libas_repo.dart';

class LibasOrder {
  final LibasItem libasItem;
  int quantity;
  final OrderType orderType;

  int get price => orderType == OrderType.Ironing
      ? libasItem.ironingPrice
      : libasItem.cleaningPrice;

  LibasOrder({
    required this.libasItem,
    required this.orderType,
    this.quantity = 0,
  });
}

class Order {
  late List<LibasOrder> libasOrders;

  List<LibasOrder> get ironingOrders => libasOrders
      .where((order) => order.orderType == OrderType.Ironing)
      .toList();

  List<LibasOrder> get cleaningOrders => libasOrders
      .where((order) => order.orderType == OrderType.CleaningIroning)
      .toList();

  List<LibasOrder> get orderItems =>
      libasOrders.where((order) => order.quantity > 0).toList();

  List<LibasOrder> get orderIroningItems => orderItems
      .where((order) => order.orderType == OrderType.Ironing)
      .toList();

  List<LibasOrder> get orderCleaningItems => orderItems
      .where((order) => order.orderType == OrderType.CleaningIroning)
      .toList();

  int get totalPrice {
    int sum = 0;
    for (var libas in libasOrders) {
      sum += libas.quantity * libas.price;
    }
    return sum;
  }

  int get totalCount {
    int count = 0;
    for (var libas in libasOrders) {
      count += libas.quantity;
    }
    return count;
  }

  String phoneNumber;
  Order({
    required this.phoneNumber,
  }) {
    libasOrders = [];
    libasOrders.addAll(
      [
        ...LibasRepo.libasItems.map(
          (libas) => LibasOrder(
            libasItem: libas,
            orderType: OrderType.Ironing,
          ),
        ),
        ...LibasRepo.libasItems.map(
          (libas) => LibasOrder(
            libasItem: libas,
            orderType: OrderType.CleaningIroning,
          ),
        )
      ],
    );
  }
}

enum OrderType { Ironing, CleaningIroning }
