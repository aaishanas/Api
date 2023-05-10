import 'dart:convert';

import 'package:flutter/material.dart';

import 'Model.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  late Future<Product> fetchData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData = fetchProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 21,
        child: FutureBuilder<Product>(
            future: fetchData,
            builder: (context, snapshot) {
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    height: 100,
                    child: Row(
                      children: [
                        Image.network(
                            "${snapshot.data!.products[index].images}"),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Column(
                          children: [
                            Text(
                              'Entry ${snapshot.data!.products[index].id}',
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${snapshot.data!.products[index].category}',
                              style: TextStyle(
                                  fontSize: 7, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${snapshot.data!.products[index].description}',
                              style: TextStyle(
                                  fontSize: 5, fontWeight: FontWeight.bold),
                            ),
                            // Text('Entry ${snapshot.data![index]}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            }),
      ),
    );
  }
}
