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
      appBar: _GalleryAppBar(),
      body: galleryWidget(),
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
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
              aspectRatio: 18/11,

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product==null? '' : product.name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.button,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product == null ? '' : formatter.format(product.price),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            )
          ],
        ),
      );


    }).toList();


  }
}


class _GalleryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _GalleryAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
