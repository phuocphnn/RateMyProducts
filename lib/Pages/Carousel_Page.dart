// ignore: file_names
// ignore_for_file: unused_import, file_names, duplicate_ignore, unused_element, prefer_const_constructors, unnecessary_new
import 'dart:convert';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ratemyfood/Pages/Model.dart';
import 'package:ratemyfood/Pages/Network.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Sliderr extends StatefulWidget {
  const Sliderr({Key key}) : super(key: key);

  @override
  _SliderrState createState() => _SliderrState();
}

class _SliderrState extends State<Sliderr> {
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
          child: Column(
            children: [
              SingleChildScrollView(
                child: CarouselSlider.builder(
                    itemCount: productData.length,
                    itemBuilder: (context, index, realIndex) {
                      final image = productData[index].image;
                      return buildImage(image, index);
                    },
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                    )),
              ),
            ],
          ),
        ));
  }

  Widget buildImage(String image, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          image,
        ),
      );
}
