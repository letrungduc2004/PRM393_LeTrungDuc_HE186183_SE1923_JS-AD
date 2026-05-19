import 'package:demo/Entity/Product.dart';
import 'dart:io';

void main() {
  int choice = 0;
  while (choice != 8) {
    print("\n===== MENU =====");
    print("1. Thêm sản phẩm");
    print("2. Xem sản phẩm");
    print("3. Cập nhật sản phẩm");
    print("4. Xóa sản phẩm");
    print("5. Tìm kiếm sản phẩm");
    print("6. Sắp xếp tăng dần theo giá");
    print("7. Sắp xếp giảm dần theo giá");
    print("8. Thoát");
    stdout.write("Nhập lựa chọn của bạn: ");

    String? input = stdin.readLineSync();
    if (input == null) continue;

    choice = int.tryParse(input) ?? 0;

    switch (choice) {
      case 1:
        addFunction();
        break;

      case 2:
        Product.viewProduct();
        break;

      case 3:
        updateFunction();
        break;

      case 4:
        deleteFunction();
        break;

      case 5:
        searchFunction();
        break;

      case 6:
        Product.sortByPriceAsc();
        print("Sản phẩm đã được sắp xếp tăng dần theo giá");
        break;

      case 7:
        Product.sortByPriceDesc();
        print("Sản phẩm đã được sắp xếp giảm dần theo giá");
        break;

      case 8:
        print("Thoát chương trình...");
        break;

      default:
        print("Lựa chọn không hợp lệ, vui lòng nhập từ 1-8.");
    }
  }
}

void addFunction() {
  stdout.write("Nhập tên sản phẩm: ");
  String name = stdin.readLineSync() ?? "";
  stdout.write("Nhập ảnh sản phẩm: ");
  String image = stdin.readLineSync() ?? "";
  stdout.write("Nhập giá sản phẩm: ");
  double price = double.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  Product.addProduct(
    Product(
      id: Product.products.length + 1,
      name: name,
      image: image,
      price: price,
    ),
  );
  print("Đã thêm sản phẩm!");
}

void updateFunction() {
  stdout.write("Nhập ID sản phẩm cần cập nhật: ");
  int id = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
  try {
    Product.findById(id);
    stdout.write("Nhập tên mới (bỏ trống nếu không đổi): ");
    String name = stdin.readLineSync() ?? "";
    stdout.write("Nhập ảnh mới (bỏ trống nếu không đổi): ");
    String image = stdin.readLineSync() ?? "";
    stdout.write("Nhập giá mới (bỏ trống nếu không đổi): ");
    String priceInput = stdin.readLineSync() ?? "";

    Product.updateProduct(
      id,
      name: name.isNotEmpty ? name : null,
      image: image.isNotEmpty ? image : null,
      price: priceInput.isNotEmpty ? double.tryParse(priceInput) : null,
    );
    print("Đã cập nhật sản phẩm!");
  } catch (e) {
    print("Không tìm thấy sản phẩm với ID $id");
  }
}

void deleteFunction() {
  stdout.write("Nhập ID sản phẩm cần xóa: ");
  int id = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
  try {
    Product.deleteProduct(id);
    print("Đã xóa sản phẩm!");
  } catch (e) {
    print("Không tìm thấy sản phẩm với ID $id");
  }
}

void searchFunction() {
  stdout.write("Nhập tên sản phẩm cần tìm: ");
  String keyword = stdin.readLineSync() ?? "";
  var result = Product.searchByName(keyword);
  if (result.isEmpty) {
    print("Không tìm thấy sản phẩm nào!");
  } else {
    print("Kết quả tìm kiếm:");
    result.forEach((pr) {
      print(
        "ID: ${pr.id}, NAME: ${pr.name}, PRICE: ${pr.price}, IMG: ${pr.image}",
      );
    });
  }
}
