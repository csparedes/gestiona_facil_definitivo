import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionafacil_v3/providers/ventas.dart';
import 'package:provider/provider.dart';

class VentaComentarioPage extends StatelessWidget {
  const VentaComentarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ventasProvider = Provider.of<VentasProvider>(context);
    String comentario = '';
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.deepPurple,
        ),
        middle: Text('Comentario de Venta'),
        border: Border(bottom: BorderSide(width: 1)),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: TextField(
                onChanged: (value) => comentario = value,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.short_text_outlined,
                    color: Colors.deepPurple,
                  ),
                  labelText: 'Comentario',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  hintText: 'Ingrese su comentario aquí',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.check,
        backgroundColor: Colors.deepPurple,
        buttonSize: 56,
        visible: true,
        onPress: () {
          ventasProvider.agregarComentario = comentario;
          Navigator.pop(context);
        },
        children: [
          SpeedDialChild(
            child: Icon(Icons.clear),
            backgroundColor: Colors.red,
            onTap: () => Navigator.pop(context),
            label: 'Cancelar',
          )
        ],
      ),
    );
  }
}
