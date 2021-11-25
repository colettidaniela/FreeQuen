import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promosnqn/crud/addnote.dart';
import 'package:promosnqn/crud/crud.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:promosnqn/home/homescreen.dart';
import 'package:promosnqn/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cuentaScreen extends StatefulWidget {
  const cuentaScreen({ Key? key }) : super(key: key);

  @override
  _cuentaScreenState createState() => _cuentaScreenState();
}

class _cuentaScreenState extends State<cuentaScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
       .collection("users")
       .doc(user!.uid)
       .get()
       .then((value) => {

      this.loggedInUser = UserModel.fromMap(value.data()),
      setState(() {}),

      });
  }

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
        title: Text("Mi cuenta"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Bienvenido Otra Vez!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain,),
              ),
              SizedBox(height: 30,),
              Text("Nombre: ${loggedInUser.nombre}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
              Text("Tipo de local: ${loggedInUser.tipolocal}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
              Text("Ubicacion del local: ${loggedInUser.ubicacionlocal}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
              Text("Gmail: ${loggedInUser.email}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
              SizedBox(height: 15,),
              ActionChip(label: Text("Logout"), onPressed: (){
                logout(context);
              }),
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