import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promosnqn/crud/addnote.dart';
import 'package:promosnqn/crud/editnote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promosnqn/firebase_login/cuenta.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:promosnqn/home/homescreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('promociones').snapshots();
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
        title: Text('Mis promos'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Algo salio mal");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              editnote(docid: snapshot.data!.docs[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 3,
                            right: 3,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              snapshot.data!.docChanges[index].doc['Titulo'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data!.docChanges[index].doc['Descripcion'],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
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