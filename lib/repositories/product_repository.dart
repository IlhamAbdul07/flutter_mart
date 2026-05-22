import '../models/product.dart';

class ProductRepository {
  List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'Sepatu Lari Nike',
        price: 850000,
        imageUrl: 'https://picsum.photos/200',
        category: 'Sepatu',
      ),
      Product(
        id: '2',
        name: 'Kaos Polos Putih',
        price: 120000,
        imageUrl: 'https://picsum.photos/201',
        category: 'Baju',
      ),
      Product(
        id: '3',
        name: 'Celana Jogger',
        price: 275000,
        imageUrl: 'https://picsum.photos/202',
        category: 'Celana',
      ),
    ];
  }
}
