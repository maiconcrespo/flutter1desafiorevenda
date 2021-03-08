import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_revenda1/pages/select_products.dart';

import '../resources/card_venda.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? revendas;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('data/dados.json').then((jsonData) {
      this.setState(() {
        revendas = jsonDecode(jsonData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Escolha uma Revenda'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.swap_vert),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: Text(
              '?',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            onTap: () {},
          ),
        )
      ]),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              height: 89,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          //color: Colors.amber,
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Botijoes de 13kg em',
                            style: TextStyle(
                                color: Colors.grey,
                                //fontWeight: FontWeight.bold,
                                fontSize: 8),
                          ),
                          Text(
                            'Av. Paulista,1001',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 21),
                          ),
                          Text(
                            'Paulista, São Paulo, SP',
                            style: TextStyle(
                                color: Colors.grey,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ],
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Column(
                        children: [Icon(Icons.location_on), Text('Mudar')],
                      ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: revendas?.length ?? 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    child: buildCardRevenda(context, revendas, index),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SelectProducts()),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
