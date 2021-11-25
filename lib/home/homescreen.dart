import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:promosnqn/crud/addnote.dart';
import 'package:promosnqn/crud/crud.dart';
import 'package:promosnqn/firebase_login/cuenta.dart';
import 'package:promosnqn/firebase_login/pantalla_login.dart';
import 'package:promosnqn/home/categoria_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

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
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('FreeQuen',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Categorias',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  color: Color(0XFF7e8595),
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0XFF7e8595),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(
                  child: Text('Inicio',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Supermercados',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Carnicerias',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Verdulerias',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Farmacias',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    InicioPage(),
                    SupermercadoPage(),
                    CarniceriaPage(),
                    VerduleriaPage(),
                    FarmaciaPage(),
                  ]
                )
              )
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0XFFb8b3c6),
        spacing: 15,
        closeManually: true,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Subir promo',
            onTap: (){
              Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addnote()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.my_library_add),
            label: 'Mis promos',
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.home),
            label: 'Inicio',
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homescreen()));
            },
          ),
        ],
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