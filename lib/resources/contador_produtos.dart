import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//? ADICIONADO DE PRODUTOS

class Contar extends StatefulWidget {
  @override
  _ContarState createState() => _ContarState();
}

class _ContarState extends State<Contar> {
  var cont = 0;

  void _add() {
    setState(() => cont++);
    print(cont);
  }

  void _remove() {
    setState(() {
      if (cont > 0) {
        cont--;
        print(cont);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            maxRadius: 10,
            child: InkWell(
              onTap: () {
                _remove();
              },
              child: Text('-',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            maxRadius: 15,
            child: Text(
              '$cont',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            maxRadius: 10,
            child: InkWell(
              onTap: () {
                _add();
              },
              child: //CircleAvatar(backgroundColor: Colors.grey,)
                  Text('+',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

//?TAG MELHOR PRECO

class TagMarca extends StatelessWidget {
  final colortag;
  final String textTag;
  TagMarca({required this.colortag, required this.textTag});
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
          Text('$textTag', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
