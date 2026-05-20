import 'package:demo/entity/Product.dart';

class ProductDAO {
  static List<Product> products = [
    Product(id: 1, name: "Laptop ASUS", image: "asus.jpg", price: 22000000),
    Product(id: 2, name: "Laptop ACES", image: "aces.jpg", price: 18000000),
    Product(id: 3, name: "IPHONE XPRO", image: "ipho.jpg", price: 32000000),
    Product(id: 4, name: "SAMSUNG A67", image: "sams.jpg", price: 12000000),
  ];

  Product findById(int idProduct) {
    Product getProductById = products.firstWhere((p) => p.id == idProduct);
    return getProductById;
  }

  void viewProduct() {
    products.forEach((pr) {
      print(
        "ID: ${pr.id}, NAME: ${pr.name}, PRICE: ${pr.price}, IMG: ${pr.image}",
      );
    });
  }

  void add(Product p) {
    if (products.any((x) => x.id == p.id)) {
      throw ArgumentError('Product with id ${p.id} already exists.');
    }
    products.add(p);
  }

  void deleteProduct(int idProduct) {
    Product pr = findById(idProduct);
    products.remove(pr);
  }

  void updateProduct(
    int idProduct, {
    String? name,
    String? image,
    double? price,
  }) {
    products = products.map((p) {
      if (p.id == idProduct) {
        return p.copyWith(name: name, image: image, price: price);
      }
      return p;
    }).toList();
  }

  List<Product> searchByName(String productName) {
    List<Product> product = products
        .where(
          (pr) => pr.name.toLowerCase().contains(productName.toLowerCase()),
        )
        .toList();
    return product;
  }

  void sortByPriceAsc() {
    products.sort((a, b) => a.price.compareTo(b.price));
    viewProduct();
  }

  void sortByPriceDesc() {
    products.sort((a, b) => b.price.compareTo(a.price));
    viewProduct();
  }

  void increasePriceByPercent(double percent) {
    final factor = 1 + percent / 100;
    products = products
        .map(
          (p) => p.copyWith(
            price: double.parse((p.price * factor).toStringAsFixed(2)),
          ),
        )
        .toList();
  }

  void increasePrice10Percent() => increasePriceByPercent(10);
}
