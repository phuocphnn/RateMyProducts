// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> productData = List();

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchProducts().then(
      (dataFromServer) {
        setState(() {
          productData = dataFromServer;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'ratemyproducts.com',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          ],
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: productData.length,
                    itemBuilder: (context, index) {
                      return new Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return new AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Card(
                                            child: Image.network(
                                              productData[index].image,
                                              width: 100,
                                            ),
                                          ),
                                          Card(
                                            child: Text(
                                              'Description: ${productData[index].description}',
                                              style: TextStyle(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: 70,
                                            height: 70,
                                            child:
                                                NumberInputWithIncrementDecrement(
                                              controller:
                                                  TextEditingController(),
                                              min: 0,
                                              max: 100,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              CoolAlert.show(
                                                context: context,
                                                type: CoolAlertType.success,
                                                text: "Buy successfull!",
                                              );
                                            },
                                            child: Text("BUY"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${productData[index].id}. ${productData[index].title}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Image.network(
                                    productData[index].image,
                                    width: 50,
                                  ),
                                  Text(
                                    'Price: ${productData[index].price}\$',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                      ),
                                      text:
                                          'Rate:${productData[index].rating.rate}',
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: String.fromCharCode(0xecf5),
                                          style: TextStyle(
                                            fontFamily: 'MaterialIcons',
                                            fontSize: 15.0,
                                            color: Colors.yellow[700],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Count :${productData[index].rating.count}',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
