import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// The "_" makes the State class private
// because it is an implementation detail of ProductsPage.

class ProductsPage extends StatefulWidget {
const ProductsPage({super.key});

@override
State<ProductsPage> createState() {
return _ProductsPageState();
}
}

class _ProductsPageState extends State<ProductsPage> {

@override
void initState() {
super.initState();
print("start Products");
}

@override
void dispose() {
print("finish Products");
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text("welcome to Products Page"),

ElevatedButton(
onPressed: () {
context.pop();
},
child: const Text("go back"),
),
],
),
),
);
}
}
