import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),

    );
  }

}

class ProductList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ProductListState();
  }

}

class ProductListState extends State<ProductList>{

  List<Product> products = [
    Product(name: 'Product 1', price: '\$10'),
    Product(name: 'Product 2', price: '\$20'),
    Product(name: 'Product 3', price: '\$30'),
    Product(name: 'Product 4', price: '\$40'),
    Product(name: 'Product 5', price: '\$50'),
    Product(name: 'Product 6', price: '\$60'),
    Product(name: 'Product 7', price: '\$70'),
    Product(name: 'Product 8', price: '\$80'),
    Product(name: 'Product 9', price: '\$90'),
    Product(name: 'Product 10', price: '\$100'),
    Product(name: 'Product 11', price: '\$110'),
    Product(name: 'Product 12', price: '\$120'),
    Product(name: 'Product 13', price: '\$130'),
    Product(name: 'Product 14', price: '\$140'),
    Product(name: 'Product 15', price: '\$150'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
          itemBuilder:(BuildContext context, int index){
            return ListTile(
              title: Text(products[index].name),
              subtitle: Text(products[index].price),
              trailing: Column(
                  children: [
                    Text('Count: '+products[index].counter.toString()),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        products[index].incrementCounter();
                        if (products[index].counter == 5){
                            showDialog(
                                context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      title:
                                      Text('Congratulations! You\'ve bought 5 ${products[index].name}!'),
                                      actions: [
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                            });
                        }
                      });
                    }, child: Text('Buy'))
                  ],
              )
            );
          } ),
      floatingActionButton: FloatingActionButton(
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CartPage(products);
                }));
            },
            child: Icon(
              Icons.shopping_cart
            ),
      ),
    );
  }

}


class Product {
  final String name;
  final String price;
  int counter = 0;

  Product({required this.name, required this.price});

  void incrementCounter() {
    counter++;
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage(this.products);

  @override
  Widget build(BuildContext context) {
    int totalProducts = products.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Products Bought: $totalProducts'),
      ),
    );
  }
}


