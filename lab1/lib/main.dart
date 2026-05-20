import 'package:demo/entity/Product.dart';
import 'package:demo/repository/ProductDAO.dart';
import 'dart:io';

ProductDAO dao = ProductDAO();

void main() {
  int choice = 0;
  while (choice != 9) {
    print("\n===== MENU =====");
    print("1. Thêm sản phẩm");
    print("2. Xem sản phẩm");
    print("3. Cập nhật sản phẩm");
    print("4. Xóa sản phẩm");
    print("5. Tìm kiếm sản phẩm");
    print("6. Sắp xếp tăng dần theo giá");
    print("7. Sắp xếp giảm dần theo giá");
    print("8. Tăng giá lên 10%");
    print("9. Thoát");
    stdout.write("Nhập lựa chọn của bạn: ");

    String? input = stdin.readLineSync();
    if (input == null) continue;

    choice = int.tryParse(input) ?? 0;

    switch (choice) {
      case 1:
        addFunction();
        break;

      case 2:
        dao.viewProduct();
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
        dao.sortByPriceAsc();
        print("Sản phẩm đã được sắp xếp tăng dần theo giá");
        break;

      case 7:
        dao.sortByPriceDesc();
        print("Sản phẩm đã được sắp xếp giảm dần theo giá");
        break;

      case 8:
        increasePriceFunction();
        break;

      case 9:
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

  dao.add(
    Product(
      id: ProductDAO.products.length + 1,
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
    dao.findById(id);
    stdout.write("Nhập tên mới (bỏ trống nếu không đổi): ");
    String name = stdin.readLineSync() ?? "";
    stdout.write("Nhập ảnh mới (bỏ trống nếu không đổi): ");
    String image = stdin.readLineSync() ?? "";
    stdout.write("Nhập giá mới (bỏ trống nếu không đổi): ");
    String priceInput = stdin.readLineSync() ?? "";

    dao.updateProduct(
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
    dao.deleteProduct(id);
    print("Đã xóa sản phẩm!");
  } catch (e) {
    print("Không tìm thấy sản phẩm với ID $id");
  }
}

void searchFunction() {
  stdout.write("Nhập tên sản phẩm cần tìm: ");
  String keyword = stdin.readLineSync() ?? "";
  var result = dao.searchByName(keyword);
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

void increasePriceFunction() {
  dao.increasePrice10Percent();

  print("Đã tăng giá tất cả sản phẩm thêm 10%");
  print("Danh sách sản phẩm sau khi cập nhật:");

  dao.viewProduct();
}
