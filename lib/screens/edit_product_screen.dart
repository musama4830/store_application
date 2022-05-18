import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product_screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  var productId;
  final _titleFocusNode = FocusNode();
  final _totalQuantityFocusNode = FocusNode();
  final _purchasePriceFocusNode = FocusNode();
  final _salePriceFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: 'null',
    title: 'null',
    totalQuantity: 0,
    purchasePrice: 0,
    salePrice: 0,
  );
  var _initValues = {
    'id': '',
    'title': '',
    'totalQuantity': '',
    'purchasePrice': '',
    'salePrice': '',
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      productId = ModalRoute.of(context)!.settings.arguments as String;
      if (productId != 'null') {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'id': _editedProduct.id,
          'title': _editedProduct.title,
          'totalQuantity': _editedProduct.totalQuantity.toString(),
          'purchasePrice': _editedProduct.purchasePrice.toString(),
          'salePrice': _editedProduct.salePrice.toString(),
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _totalQuantityFocusNode.dispose();
    _purchasePriceFocusNode.dispose();
    _salePriceFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (productId != 'null') {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: productId != 'null'
            ? const Text('Edit Product')
            : const Text('Add New Product'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['id'],
                decoration: const InputDecoration(labelText: 'Id'),
                autofocus: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: value as String,
                    title: _editedProduct.title,
                    totalQuantity: _editedProduct.totalQuantity,
                    purchasePrice: _editedProduct.purchasePrice,
                    salePrice: _editedProduct.salePrice,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['title'],
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                focusNode: _titleFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_totalQuantityFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: value as String,
                    totalQuantity: _editedProduct.totalQuantity,
                    purchasePrice: _editedProduct.purchasePrice,
                    salePrice: _editedProduct.salePrice,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['totalQuantity'],
                decoration: const InputDecoration(labelText: 'Total Quantity'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _totalQuantityFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_purchasePriceFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Quantity.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    totalQuantity: double.parse(value!),
                    purchasePrice: _editedProduct.purchasePrice,
                    salePrice: _editedProduct.salePrice,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['purchasePrice'],
                decoration: const InputDecoration(labelText: 'Purchase Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _purchasePriceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_salePriceFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Purchase Price.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    totalQuantity: _editedProduct.totalQuantity,
                    purchasePrice: int.parse(value!),
                    salePrice: _editedProduct.salePrice,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['salePrice'],
                decoration: const InputDecoration(labelText: 'Sale Price'),
                keyboardType: TextInputType.number,
                focusNode: _salePriceFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Sale Price.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  // if (int.parse(value) <= _editedProduct.purchasePrice) {
                  //   return 'Please enter a number greater than Purchase Price.';
                  // }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    totalQuantity: _editedProduct.totalQuantity,
                    purchasePrice: _editedProduct.purchasePrice,
                    salePrice: int.parse(value!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
