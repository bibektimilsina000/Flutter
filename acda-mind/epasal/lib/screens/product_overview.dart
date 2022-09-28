import '/screens/detail_product.dart';
import 'package:epasal/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

void main() => runApp(ProductOverview());

class ProductOverview extends StatelessWidget {
  final List<Product> lodedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
      ),
      body: ProductGridView(lodedProducts: lodedProducts),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.lodedProducts,
  }) : super(key: key);

  final List<Product> lodedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: lodedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetail.routeName,
                arguments: lodedProducts[index].id);
          },
          child: ProductItem(
              id: lodedProducts[index].id,
              title: lodedProducts[index].title,
              description: lodedProducts[index].description,
              price: lodedProducts[index].price,
              imageUrl: lodedProducts[index].imageUrl),
        );
      },
    );
  }
}
