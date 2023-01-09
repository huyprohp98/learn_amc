import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String? productId;
  final int? id;
  final String? name;
  const ProductPage({Key? key, this.productId, this.id, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Product Id:- $productId",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            " Id:- $id",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            "Name:- $name",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      )),
    );
  }
}
