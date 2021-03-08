import 'package:flutter/material.dart';

Widget buildCardRevenda(BuildContext context, revendas, index) {
  String tipo = revendas[index]['tipo'];
  String nome = revendas[index]['nome'];
  String cor = revendas[index]['cor'];
  double nota = revendas[index]['nota'];
  String tempoMedio = revendas[index]['tempoMedio'];
  bool melhorPreco = revendas[index]['melhorPreco'];
  double preco = revendas[index]['preco'];
  return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ), //CARD NAME
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              color: Color(int.parse('0xFF' + cor)),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            padding: EdgeInsets.all(10),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                tipo,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ), //CARD CONTENT
          Expanded(
            child: Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                nome,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Expanded(
                              flex: 2,
                              child: Visibility(
                                  visible: melhorPreco == true,
                                  child: TagBestPrice(
                                    colortag: Color(int.parse('0xFFFF8635')),
                                  )))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            //color: Colors.amber,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nota',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '$nota',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 30,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tempo Médio',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          tempoMedio,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),

                                        //color: Colors.amber,

                                        Container(
                                          height: 28,
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              ' min',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Preço',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'R\$ $preco',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ));
}

//?TAG MELHOR PRECO
class TagBestPrice extends StatelessWidget {
  var colortag = Color(int.parse('0xFFFF8635'));

  TagBestPrice({
    required this.colortag,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colortag,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      height: 34,
      //width: 89,
      child: Row(
        children: [
          Icon(Icons.stacked_bar_chart, color: Colors.white),
          Text('Melhor Preço', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
