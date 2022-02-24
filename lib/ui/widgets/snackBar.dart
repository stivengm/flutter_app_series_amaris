import 'package:flutter/material.dart';

class SnackBarMensaje  {

  final BuildContext context;
  final String nombreLabel;
  final Function? funcion;
  final bool accionBoton;
  final int duracion;

  SnackBarMensaje( this.context,  {this.funcion, this.nombreLabel = 'Cerrar', this.accionBoton = false, this.duracion = 3 } );

  void lanzar( ) {
    final snackBar = SnackBar(
      content: _mensaje(),
      duration: Duration(seconds: duracion),
      padding: const EdgeInsets.all(8.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _mensaje() {
    return const Text('Email o contraseña incorrecta');
  }

}