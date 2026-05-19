class Product {
  final int id;
  String name;
  String image;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  static List<Product> products = [
    Product(id: 1, name: "Laptop ASUS", image: "asus.jpg", price: 22000000),
    Product(id: 2, name: "Laptop ACES", image: "aces.jpg", price: 18000000),
    Product(id: 3, name: "IPHONE XPRO", image: "ipho.jpg", price: 32000000),
    Product(id: 4, name: "SAMSUNG A67", image: "sams.jpg", price: 12000000),
  ];

  static Product findById(int idProduct) {
    Product getProductById = products.firstWhere(
      (p) => p.id == idProduct);
    return getProductById;
  }

  static void viewProduct() {
    products.forEach((pr) {
      print(
        "ID: ${pr.id}, NAME: ${pr.name}, PRICE: ${pr.price}, IMG: ${pr.image}",
      );
    });
  }

  static void addProduct(Product product) {
    products.add(product);
  }

  static void deleteProduct(int idProduct) {
    Product pr = findById(idProduct);
    products.remove(pr);
  }

  static void updateProduct(
    int idProduct, {
    String? name,
    String? image,
    double? price,
  }) {
    Product product = findById(idProduct);

    if (name != null) {
      product.name = name;
    }
    if (image != null) {
      product.image = image;
    }
    if (price != null) {
      product.price = price;
    }
  }

  static List<Product> searchByName(String productName) {
    List<Product> product = products
        .where(
          (pr) => pr.name.toLowerCase().contains(productName.toLowerCase()),
        )
        .toList();
    return product;
  }

  static void sortByPriceAsc() {
    products.sort((a, b) => a.price.compareTo(b.price));
    viewProduct();
  }

  static void sortByPriceDesc() {
    products.sort((a, b) => b.price.compareTo(a.price));
    viewProduct();
  }
}
