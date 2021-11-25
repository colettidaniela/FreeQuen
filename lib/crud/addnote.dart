import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promosnqn/crud/crud.dart';

import 'package:flutter/material.dart';
import 'package:promosnqn/firebase_login/cuenta.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:promosnqn/home/homescreen.dart';

class addnote extends StatelessWidget {
  TextEditingController Titulo = TextEditingController();
  TextEditingController Ubicacion = TextEditingController();
  TextEditingController Duracion = TextEditingController();
  TextEditingController Descripcion = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('promociones');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Inicio'),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homescreen()));
              },
            ),
            ListTile(
              title: Text('Mi cuenta'),
              leading: Icon(Icons.person),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => cuentaScreen()));
              },
            ),
            ListTile(
              title: Text('Mis promos'),
              leading: Icon(Icons.my_library_add),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              title: Text('Subir promos'),
              leading: Icon(Icons.add),
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => addnote()));
              },
            ),
            ListTile(
              title: Text('Google Maps'),
              leading: Icon(Icons.map_sharp),
              onTap: (){},
            ),
            ListTile(
              title: Text('Iniciar como cliente'),
              leading: Icon(Icons.device_unknown),
              onTap: (){},
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              leading: Icon(Icons.logout),
              onTap: (){
                logout(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XFFb8b3c6),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'Titulo': Titulo.text,
                'Ubicacion': Ubicacion.text,
                'Duracion': Duracion.text,
                'Descripcion': Descripcion.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text(
              "Guardar",
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
  
  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen())
    );
  }
}