import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/modules/core/components/Layout.dart';

import 'package:grocery_list/modules/products/models/Product.dart';

class CreateProductForm extends StatefulWidget {
  @override
  _CreateProductFormState createState() => new _CreateProductFormState();
}

class _CreateProductFormState extends State<CreateProductForm> {
  final formKey = GlobalKey<FormState>();

  String _name;
  String _description;

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      CollectionReference productsReference =
          Firestore.instance.collection("products");

      final Product newProduct =
          new Product(name: _name, description: _description);

      Firestore.instance.runTransaction((Transaction tx) async {
        await productsReference.add(newProduct.toJson()).catchError((e) {
          showError();
        });
        Navigator.of(context).pop();
      });
    }
  }

  showError() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Error while submitting form!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Create product form',
      body: Builder(builder: (BuildContext context) {
        return Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name *',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                  },
                  onSaved: (value) => _name = value,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description ',
                  ),
                  onSaved: (value) => _description = value,
                ),
              ),
              RaisedButton(
                onPressed: _saveForm,
                child: Text('Submit'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
