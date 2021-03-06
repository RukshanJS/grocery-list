import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/grocery_bar.dart';
import 'package:grocery_list/widgets/grocery_drawer.dart';

class Layout extends StatelessWidget {
  Layout(
      {@required this.title, @required this.body, this.floatingActionButton});

  final String title;
  final Widget body;
  final Widget floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GroceryDrawer(),
      backgroundColor: Colors.white,
      appBar: GroceryBar(title: this.title),
      floatingActionButton: this.floatingActionButton,
      body: body,
    );
  }
}
