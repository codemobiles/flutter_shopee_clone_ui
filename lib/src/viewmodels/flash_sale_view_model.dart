import 'package:flutter_shopee_clone_ui/src/models/flash_sale_model.dart';

class FlashSaleViewModel {
  List<FlashSaleModel> getFlashSale() {
    return [
      FlashSaleModel(
        image:
            "https://cdn.pixabay.com/photo/2016/11/18/13/47/apple-1834639_1280.jpg",
        price: 12520,
        discountPercentage: 50,
        qty: 1000,
        sold: 900,
        mall: true,
      ),
      FlashSaleModel(
        image:
            "https://cdn.pixabay.com/photo/2010/12/13/10/05/citrus-2272_1280.jpg",
        price: 5852,
        discountPercentage: 70,
        qty: 500,
        sold: 250,
      ),
      FlashSaleModel(
        image:
            "https://st.depositphotos.com/2224328/4983/v/450/depositphotos_49834021-stock-illustration-avocado-with-slice-on-white.jpg",
        price: 320,
        discountPercentage: 30,
        qty: 50,
        sold: 10,
        mall: true,
      ),
      FlashSaleModel(
        image: "https://i.dlpng.com/static/png/487999_preview.png",
        price: 5228,
        discountPercentage: 70,
        qty: 512,
        sold: 320,
      ),
    ];
  }
}
