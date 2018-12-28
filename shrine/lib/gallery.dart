import 'package:flutter/material.dart';
import 'package:shrine/backdrop.dart';
import 'package:shrine/category_menu_page.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/product.dart';
import 'package:shrine/products_repository.dart';

import 'package:intl/intl.dart';

class GalleryScreen extends StatefulWidget {
  @override
  createState() => new GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {

  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Backdrop(

      category: _currentCategory,
      // TODO: Pass _currentCategory for frontLayer (104)
      frontLayer: galleryWidget(category: _currentCategory),
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      backLayer: CategoryMenuPage(
        currentCategory: _currentCategory,
        onCategoryTap: _onCategoryTap,
      ),
      frontTitle: Text('SHRINE'),
      backTitle: Text('MENU'),
    );
  }



  galleryWidget({Category category}) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 8/9,
      padding: EdgeInsets.all(32.0),
      children: _generateShoppingCards(10),
    );
  }




  List<Card> _generateShoppingCards(int count) {

    List<Product> products = ProductsRepository.loadProducts(_currentCategory);

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


