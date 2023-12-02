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
            orderType: OrderType.CleaningIroning,
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
