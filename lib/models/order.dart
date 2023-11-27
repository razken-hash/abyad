// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abyad/models/clothe_item.dart';

class Order {
  List<ClotheItem> clothes;
  String phoneNumber;
  Order({
    required this.clothes,
    required this.phoneNumber,
  });

  static Order empty() {
    return Order(
      clothes: [],
      phoneNumber: "",
    );
  }
}

enum OrderType { Ironing, CleaningIroning }
