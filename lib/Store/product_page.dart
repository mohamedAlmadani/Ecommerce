import 'package:ecommerce/Widgets/customAppBar.dart';
import 'package:ecommerce/Widgets/myDrawer.dart';
import 'package:ecommerce/modals/book.dart';


import 'package:ecommerce/notifiers/BookQuantity.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce/Store/storehome.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class ProductPage extends StatefulWidget {
  final ProductModel productModel;

  ProductPage({this.productModel});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantityOfBooks = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: ListView(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                      child: Text(widget.productModel.title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),

                  ],
                ),
                Stack(
                  children: <Widget>[
                    Center(
                        child: card(
                            primaryColor: Colors.red,
                            imgPath: widget.productModel.thumbnailUrl)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        alignment: Alignment.topLeft,
                        width: 40.0,
                        height: 40.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "50%",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "OFF",
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "M.R.P.: شيكل",
                        style: TextStyle(),
                      ),
                      Text(
                        "300.0",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Price: ",
                        style: TextStyle(),
                      ),
                      Text(
                        "شيكل",
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
                      Text(
                        widget.productModel.price.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Qty"),
                          content: Container(
                            height: 500.0,
                            width: 200.0,
                            child: ListView.builder(
                              itemCount: 15,
                              itemBuilder: (_, index) {
                                return ListTile(
                                    title: Text((index + 1).toString()),
                                    subtitle: Divider(
                                      height: 5,
                                    ),
                                    onTap: () {
                                      Provider.of<BookQuantity>(context,
                                              listen: false)
                                          .display(index + 1);
                                      Navigator.pop(context);
                                    });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 105.0,
                      //height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87, width: 1.0),
                          gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.4),
                                Colors.grey.withOpacity(0.8),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Consumer<BookQuantity>(builder: (_, quantity, __) {
                            return Text(
                              "Quantity: ${quantity.noOfBooks}",
                              style: TextStyle(),
                            );
                          }),     Icon(Icons.arrow_drop_down),
                       ],
                      ),
                   ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: InkWell(
                      onTap: () =>
                          checkItemInCart(widget.productModel.title, context),


                      child: Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.white54, width: 1.0),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.lightBlue,
                                  Colors.lightBlue,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        width: MediaQuery.of(context).size.width - 40.0,
                        height: 50.0,
                        child: Center(child: Text("Add to Cart")),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 20.0, bottom: 10.0),
                  child: Text(
                    "About this Item",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black87,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.productModel.longDescription,
                            //"There are several things to consider in order to help your book achieve its greatest potential discoverability. Readers, librarians, and retailers can't purchase a book they can't find, and your book metadata is responsible for whether or not your book pops up when they type in search terms relevant to your book. Book metadata may sound complicated, but it consists of all the information that describes your book, including: your title, subtitle, series name, price, trim size, author name, book description, and more. There are two metadata fields for your book description: the long book description and the short book description. Although both play a role in driving traffic to your book, they have distinct differences.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ]),
      ),
    );
  }
}