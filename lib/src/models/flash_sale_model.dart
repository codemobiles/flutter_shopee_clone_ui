class FlashSaleModel {
  final bool mall;
  final int discountPercentage;
  final String image;
  final double price;
  final int qty;
  final int sold;

  FlashSaleModel({
    this.mall = false,
    this.price = 0.0,
    this.discountPercentage = 0,
    this.image,
    this.qty = 0,
    this.sold = 0,
  });
}
