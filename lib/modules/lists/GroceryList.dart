import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/components/GroceryListItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';

class GroceryList extends StatelessWidget {
  GroceryList({this.lists, this.deleteList});

  final List<GroceryListModel> lists;
  final Function deleteList;

  @override
  Widget build(BuildContext context) {
    // TODO remove duplicate code
    void _pushAddList(BuildContext context) {
      Navigator.pushNamed(context, '/new-list');
    }

    Widget _buildListItem(BuildContext context, int index) {
      return lists != []
          ? ListItem(list: lists[index], deleteList: deleteList)
          : ListItem();
    }

    return Layout(
      title: 'Grocery lists',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAddList(context),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: _buildListItem,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
