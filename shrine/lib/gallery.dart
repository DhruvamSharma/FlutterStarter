import 'package:flutter/material.dart';
import 'package:shrine/product.dart';
import 'package:shrine/products_repository.dart';

import 'package:intl/intl.dart';

class GalleryScreen extends StatefulWidget {
  @override
  createState() => new GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar(),
      body: galleryWidget(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        "SHRINE",
        semanticsLabel: "Application Name",
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          semanticLabel: "Menu icon",
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: "Search icon",
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              semanticLabel: "Shopping Cart icon",
            ),
            onPressed: () {}),
      ],
    );
  }

  galleryWidget() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 8/9,
      padding: EdgeInsets.all(16.0),
      children: _generateShoppingCards(10),
    );
  }


  List<Card> _generateShoppingCards(int count) {

    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
              aspectRatio: 18/11,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formatter.format(product.price),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );


    }).toList();


  }
}
