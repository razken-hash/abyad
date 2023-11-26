class ClotheItem {
  final String name;
  final int price;
  int quantity;

  ClotheItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}
