import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Product.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product state demo home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ProductBox(item: items[index]);
          },
        )
    );
  }
}
class RatingBox extends StatelessWidget {
  RatingBox({Key? key, required this.item}) : super(key: key);
  final Product item;
  Widget build(BuildContext context) {
    double _size = 20;
    print(item.rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                item.rating >= 1? Icon( Icons.star, size: _size, )
                    : Icon( Icons.star_border, size: _size, )
            ),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(1),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 2
                ? Icon(
              Icons.star,
              size: _size,
            )
                : Icon(
              Icons.star_border,
              size: _size,
            )
            ),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(2),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                item.rating >= 3 ?
                Icon( Icons.star, size: _size, )
                    : Icon( Icons.star_border, size: _size, )
            ),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(3),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: GestureDetector(
              onTap: () {
                this.item.updateRating(0);
              },
              child: Text( 'Clear', )
          ),
        ),
      ],
    );
  }
}
class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: ScopedModel<Product>(
                            model: this.item, child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                                this.item.name, style: TextStyle(
                                fontWeight: FontWeight.bold
                            )
                            ),
                            Text(this.item.description),
                            Text("Price: " + this.item.price.toString()),
                            ScopedModelDescendant<Product>(
                                builder: (context, child, item) {
                                  return RatingBox(item: item);
                                }
                            )
                          ],
                        )
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}