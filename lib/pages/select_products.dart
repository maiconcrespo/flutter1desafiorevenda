import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_revenda1/resources/card_compra.dart';

class SelectProducts extends StatefulWidget {
  @override
  _SelectProductsState createState() => _SelectProductsState();
}

class _SelectProductsState extends State<SelectProducts> {
  List<dynamic>? compras;

  _SelectProductsState();

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('data/dados.json').then((jsonData) {
      this.setState(() {
        compras = jsonDecode(jsonData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
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
        ],
        title: Text('Selecionar Produtos'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.blue[400],
                        ),
                        Text(
                          'Comprar',
                          style: TextStyle(
                            color: Colors.blue[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Icon(Icons.radio_button_unchecked),
                        Text('Pagamento'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Icon(Icons.radio_button_unchecked),
                        Text('Confirmção'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              //  margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Unigas- Botijao 13kg')
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'R\$',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                text: '24,00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30))
                          ]))
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
                  itemCount: 1, //compras?.length ?? 0,
                  itemBuilder: (_, index) {
                    return cardCompra(context, index, compras);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
