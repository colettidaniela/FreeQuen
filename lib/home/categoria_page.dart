import 'package:flutter/material.dart';
import 'package:promosnqn/home/detalles.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Productos de limpieza', 'Jumbo', 'assets/jumbologo.png',
                      false, false, context),
                  _buildCard('50% descuento', 'La carniceria', 'assets/carnicerialogo.png',
                      true, false, context),
                  _buildCard('2X1', 'Super verde',
                      'assets/verdulerialogo.png', false, true, context),
                  _buildCard('20% descuento', 'Monasterio', 'assets/farmacialogo.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String descuentoname, String local, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InicioDetail(
                    assetPath: imgPath,
                    localname: local,
                    descuento: descuentoname
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(12.0),),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 8.0),
                  Text(local,
                      style: TextStyle(
                          color: Color(0xFFb8b3c6),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(descuentoname,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ]
                          ]))
                ]))));
  }
}


class SupermercadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Productos de limpieza', 'Jumbo', 'assets/jumbologo.png',
                      false, false, context),
                  _buildCard('Bebidas', 'La anonima', 'assets/Laanonimalogo.png',
                      true, false, context),
                  _buildCard('Jugueteria', 'Coto',
                      'assets/cotologo.png', false, true, context),
                  _buildCard('Muebles', 'Easy', 'assets/easylogo.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String descuentoname, String local, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SuperDetail(
                    assetPath: imgPath,
                    localname: local,
                    descuento: descuentoname
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(12.0),),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 8.0),
                  Text(local,
                      style: TextStyle(
                          color: Color(0xFFb8b3c6),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(descuentoname,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ]
                          ]))
                ]))));
  }
}


class CarniceriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('50% descuento', 'La carniceria', 'assets/carnicerialogo.png',
                      false, false, context),
                  _buildCard('2x1', 'Salvador', 'assets/carnicerialogo2.png',
                      true, false, context),
                  _buildCard('10% descuento', 'La selecta',
                      'assets/carnicerialogo3.png', false, true, context),
                  _buildCard('50% descuento', 'Los tres cochinitos', 'assets/carnicerialogo4.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String descuentoname, String local, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CarniceriaDetail(
                    assetPath: imgPath,
                    localname: local,
                    descuento: descuentoname
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(12.0),),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 8.0),
                  Text(local,
                      style: TextStyle(
                          color: Color(0xFFb8b3c6),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(descuentoname,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ]
                          ]))
                ]))));
  }
}


class VerduleriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('2x1', 'Super verde', 'assets/verdulerialogo.png',
                      false, false, context),
                  _buildCard('50% descuento', 'Veruleria venado', 'assets/verdulerialogo2.png',
                      true, false, context),
                  _buildCard('10% descuento', 'Panchito',
                      'assets/verdulerialogo3.png', false, true, context),
                  _buildCard('30% descuento', 'Megaverde', 'assets/verdulerialogo4.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String descuentoname, String local, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VerduleriaDetail(
                    assetPath: imgPath,
                    localname: local,
                    descuento: descuentoname
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(12.0),),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 8.0),
                  Text(local,
                      style: TextStyle(
                          color: Color(0xFFb8b3c6),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(descuentoname,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ]
                          ]))
                ]))));
  }
}


class FarmaciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('20% descuento', 'Monasterio', 'assets/farmacialogo.png',
                      false, false, context),
                  _buildCard('50% descuento', 'Farmacity', 'assets/farmacialogo2.png',
                      true, false, context),
                  _buildCard('2X1', 'Farmacia Internacional',
                      'assets/farmacialogo4.png', false, true, context),
                  _buildCard('20% descuento', 'Alphega', 'assets/farmacialogo3.png',
                      false, false, context)
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String descuentoname, String local, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FarmaciaDetail(
                    assetPath: imgPath,
                    localname: local,
                    descuento: descuentoname
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(12.0),),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 8.0),
                  Text(local,
                      style: TextStyle(
                          color: Color(0xFFb8b3c6),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(descuentoname,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.map,
                                  color: Color(0xFFb8b3c6), size: 12.0),
                              Text('Google Maps',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFb8b3c6),
                                      fontSize: 12.0))
                            ]
                          ]))
                ]))));
  }
}

 