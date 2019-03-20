import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';
import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';

class GroceryListDetail extends StatelessWidget {
  final products = <Widget>[
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem(),
    ProductItem()
  ];

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'List detail',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(children: products),
          ),
        ],
      ),
    );
  }
}
