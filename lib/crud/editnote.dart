import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:promosnqn/crud/crud.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({required this.docid});

  @override
  _editnoteState createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  TextEditingController Titulo = TextEditingController();
  TextEditingController Ubicacion = TextEditingController();
  TextEditingController Duracion = TextEditingController();
  TextEditingController Descripcion = TextEditingController();

  @override
  void initState() {
    Titulo = TextEditingController(text: widget.docid.get('Titulo'));
    Ubicacion = TextEditingController(text: widget.docid.get('Ubicacion'));
    Duracion = TextEditingController(text: widget.docid.get('Duracion'));
    Descripcion = TextEditingController(text: widget.docid.get('Descripcion'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'Titulo': Titulo.text,
                'Ubicacion': Ubicacion.text,
                'Duracion': Duracion.text,
                'Descripcion': Descripcion.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("Guardar"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("Eliminar"),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: Titulo,
                  decoration: InputDecoration(
                    hintText: 'Titulo',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: Ubicacion,
                  decoration: InputDecoration(
                    hintText: 'Ubicacion',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: Duracion,
                  decoration: InputDecoration(
                    hintText: 'Duracion',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: Descripcion,
                  decoration: InputDecoration(
                    hintText: 'Descripcion',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}