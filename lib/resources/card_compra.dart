import 'package:flutter/material.dart';

import 'contador_produtos.dart';

Widget cardCompra(BuildContext context, index, compras) {
  String tipo = compras[index]['tipo'];
  String nome = compras[index]['nome'];
  double nota = compras[index]['nota'];
  String tempoMedio = compras[index]['tempoMedio'];
  double preco = compras[index]['preco'];
  return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Container(
            //color: Colors.amber,
            height: 60,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text('$nome'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '$nota',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('$tempoMedio min'),
                      ],
                    ),
                    Container(
                        height: 20,
                        child: TagMarca(
                          colortag: Color(int.parse('0xFF000000')),
                          textTag: '$tipo',
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Botijao 13kg '),
                      Text('$nome'),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'R\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 8),
                          ),
                          TextSpan(
                              text: '$preco',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: [Contar()],
                  ),
                ],
              ),
            ],
          )
        ],
      ));
}
