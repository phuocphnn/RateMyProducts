import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _wsj = [];
  List _techcrunch = [];
  List _business = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const API_URL =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8f308063952e4028aba1dcc0f256ff77';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _wsj = data;
    });
  }

  Future<void> _fetchData1() async {
    const API_URL =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8f308063952e4028aba1dcc0f256ff77';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _techcrunch = data;
    });
  }

  Future<void> _fetchData2() async {
    const API_URL =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8f308063952e4028aba1dcc0f256ff77';

    final response = await http.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["articles"];
    setState(() {
      _business = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RATE MY NEWS'),
        ),
        body: Container(
          height: 10000.0,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 10000.0,
                    child: Center(
                        child: Carousel(
                      images: [
                        //slide 1
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img1.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _wsj.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _wsj[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(_wsj[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_wsj[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),

                        //slide 2
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img2.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData1,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _techcrunch.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _techcrunch[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title:
                                            Text(_techcrunch[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_techcrunch[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),

                        //slide 3
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {}, // handle your image tap here
                              child: Image.asset(
                                'img/img3.jpg',
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0,
                              ),
                            ),
                            ElevatedButton(
                              child: Text('SHOW'),
                              onPressed: _fetchData2,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  height: 1000.0,
                                  child: ListView.builder(
                                    itemCount: _business.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return ListTile(
                                        leading: Image.network(
                                          _business[index]["urlToImage"],
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(_business[index]['title']),
                                        subtitle: Text(
                                            'NEWS ID: ${_business[index]["id"]}'),
                                      );
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                      autoplay: false,
                    ))),
              ],
            ),
          )),
        ));

    // The ListView that displays photos
  }
}
