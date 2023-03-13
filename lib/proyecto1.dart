import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Practica1 extends StatefulWidget {
  const Practica1({Key? key}) : super(key: key);

  @override
  State<Practica1> createState() => _Practica1State();
}

class _Practica1State extends State<Practica1> {
  final txt1 = TextEditingController();
  final txt2 = TextEditingController();
  String txt = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto 1',style: TextStyle(),),
        actions:[
          IconButton(icon:const Icon(Icons.info), onPressed:(){_mostrarVentanaEmergente();}),
        ]
      ),
      body: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Combina los dos textos con el boton c:',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 30),
          Padding(padding: EdgeInsets.all(40), child:TextField(controller: txt1,decoration: InputDecoration(labelText: 'texto 1'),),),
          const SizedBox(height: 10),
          Padding(padding: EdgeInsets.all(40), child:TextField(controller: txt2,decoration: InputDecoration(labelText: 'texto 2'),)),
          const SizedBox(height: 30),
          OutlinedButton(onPressed: (){
            setState(() {
              txt = txt1.text + txt2.text;
            });
          }, child: Text('Combina')),
          const SizedBox(height: 30),
          Text('${txt}',style: TextStyle(fontSize: 20,color: Colors.red),)
        ],
      )

      )
    );
  }

  void _mostrarVentanaEmergente() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dato interesante'),
          content: Text('El corazón humano puede generar tanta presión al bombear sangre que podría lanzarla a 10 metros de distancia.'),
          actions: <Widget>[
            FilledButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

