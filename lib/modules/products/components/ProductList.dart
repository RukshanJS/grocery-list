import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = <Widget>[ProductItem(), ProductItem(), ProductItem()];

    return Layout(
      title: 'Products list',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return products[index];
              },
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
